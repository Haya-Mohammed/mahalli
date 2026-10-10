import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';

class DecodedBackup {
  const DecodedBackup({required this.databaseBytes, required this.createdAt});

  final Uint8List databaseBytes;
  final DateTime createdAt;
}

/// A self-contained backup payload. Keeping the manifest in the same archive
/// prevents a database file from being shared without its checksum metadata.
class BackupArchive {
  static const formatVersion = 1;
  static const maxDatabaseBytes = 512 * 1024 * 1024;
  static const _databaseName = 'mahalli.isar';
  static const _manifestName = 'manifest.json';

  static Uint8List encode({
    required Uint8List databaseBytes,
    required DateTime createdAt,
  }) {
    final manifest = utf8.encode(
      jsonEncode({
        'formatVersion': formatVersion,
        'createdAt': createdAt.toUtc().toIso8601String(),
        'databaseFile': _databaseName,
        'checksum': sha256.convert(databaseBytes).toString(),
      }),
    );
    final archive = Archive()
      ..addFile(ArchiveFile(_databaseName, databaseBytes.length, databaseBytes))
      ..addFile(ArchiveFile(_manifestName, manifest.length, manifest));
    final zipBytes = ZipEncoder().encode(archive);
    if (zipBytes == null) {
      throw const FormatException('Could not encode backup');
    }
    return Uint8List.fromList(zipBytes);
  }

  static DecodedBackup? decode(Uint8List zipBytes) {
    try {
      final archive = ZipDecoder().decodeBytes(zipBytes, verify: true);
      final database = archive.findFile(_databaseName);
      final manifest = archive.findFile(_manifestName);
      if (database == null ||
          manifest == null ||
          database.isFile == false ||
          database.size > maxDatabaseBytes ||
          manifest.size > 64 * 1024) {
        return null;
      }
      final databaseBytes = Uint8List.fromList(database.content as List<int>);
      final data =
          jsonDecode(utf8.decode(manifest.content as List<int>))
              as Map<String, dynamic>;
      if (data['formatVersion'] != formatVersion ||
          data['databaseFile'] != _databaseName ||
          data['checksum'] != sha256.convert(databaseBytes).toString()) {
        return null;
      }
      final createdAt = DateTime.tryParse(data['createdAt'] as String? ?? '');
      return createdAt == null
          ? null
          : DecodedBackup(databaseBytes: databaseBytes, createdAt: createdAt);
    } catch (_) {
      return null;
    }
  }
}
