import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/features/backup/domain/models/backup_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../domain/backup_archive.dart';

class BackupService {
  BackupService(this.isar);
  final Isar isar;
  Future<BackupInfo> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final time = DateTime.now();
    final file = File(
      '${dir.path}${Platform.pathSeparator}mahalli-${time.millisecondsSinceEpoch}.zip',
    );
    final databaseFile = File(
      '${dir.path}${Platform.pathSeparator}.mahalli-backup-${time.microsecondsSinceEpoch}.isar',
    );
    try {
      await isar.copyToFile(databaseFile.path);
      final databaseBytes = await databaseFile.readAsBytes();
      final archive = BackupArchive.encode(databaseBytes: databaseBytes, createdAt: time);
      await file.writeAsBytes(archive, flush: true);
      final decoded = BackupArchive.decode(archive);
      if (decoded == null) {
        throw const FormatException('Invalid backup archive');
      }
      return BackupInfo(file: file, createdAt: time, checksum: _checksum(decoded.databaseBytes));
    } finally {
      if (await databaseFile.exists()) {
        await databaseFile.delete();
      }
    }
  }

  Future<bool> validate(File file) async {
    if (!await file.exists() || await file.length() > BackupArchive.maxDatabaseBytes) {
      return false;
    }
    return BackupArchive.decode(await file.readAsBytes()) != null;
  }

  Future<void> share(BackupInfo backup) =>
      SharePlus.instance.share(ShareParams(files: [XFile(backup.file.path)]));

  /// Replaces the database only after validation and a safety copy. The app
  /// must be restarted afterwards so every repository receives the new Isar.
  Future<void> restore(File source) async {
    if (!await validate(source)) throw const FormatException('Invalid backup');
    final decoded = BackupArchive.decode(await source.readAsBytes());
    if (decoded == null) throw const FormatException('Invalid backup');
    final directory = isar.directory;
    if (directory == null) {
      throw const FileSystemException('Database directory unavailable');
    }
    final target = File('$directory${Platform.pathSeparator}${isar.name}.isar');
    final safety = File('${target.path}.pre_restore');
    final staged = File('${target.path}.restore');
    await isar.close();
    try {
      if (await target.exists()) {
        await target.copy(safety.path);
      }
      await staged.writeAsBytes(decoded.databaseBytes, flush: true);
      await staged.copy(target.path);
      await staged.delete();
    } catch (_) {
      if (await safety.exists()) {
        await safety.copy(target.path);
      }
      if (await staged.exists()) {
        await staged.delete();
      }
      rethrow;
    }
  }

  static String _checksum(Uint8List bytes) => sha256.convert(bytes).toString();
}
