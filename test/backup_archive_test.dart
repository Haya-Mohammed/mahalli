import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/features/backup/domain/backup_archive.dart';

void main() {
  test('backup archive round-trips the database and validates checksum', () {
    final database = Uint8List.fromList([1, 2, 3, 4, 5]);
    final archive = BackupArchive.encode(
      databaseBytes: database,
      createdAt: DateTime.utc(2026, 10, 6),
    );

    final decoded = BackupArchive.decode(archive);

    expect(decoded, isNotNull);
    expect(decoded!.databaseBytes, database);
    expect(decoded.createdAt, DateTime.utc(2026, 10, 6));
  });

  test('backup archive rejects corrupt input', () {
    expect(BackupArchive.decode(Uint8List.fromList([1, 2, 3])), isNull);
  });
}
