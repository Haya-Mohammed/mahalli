import 'dart:io';

class BackupInfo {
  const BackupInfo({required this.file, required this.createdAt, required this.checksum});
  final File file;
  final DateTime createdAt;
  final String checksum;
}
