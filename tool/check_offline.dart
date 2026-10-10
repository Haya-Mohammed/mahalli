import 'dart:io';

const _forbiddenPackages = [
  'dio',
  'http',
  'firebase_core',
  'cloud_firestore',
  'firebase_auth',
  'firebase_analytics',
  'firebase_crashlytics',
];

void main() {
  final root = Directory.current;
  final failures = <String>[];
  final pubspec = File('${root.path}${Platform.pathSeparator}pubspec.yaml');
  final manifest = File(
    '${root.path}${Platform.pathSeparator}android${Platform.pathSeparator}app'
    '${Platform.pathSeparator}src${Platform.pathSeparator}main'
    '${Platform.pathSeparator}AndroidManifest.xml',
  );
  final infoPlist = File(
    '${root.path}${Platform.pathSeparator}ios${Platform.pathSeparator}Runner'
    '${Platform.pathSeparator}Info.plist',
  );

  if (!pubspec.existsSync() ||
      !manifest.existsSync() ||
      !infoPlist.existsSync()) {
    stderr.writeln('Run this check from the Mahalli project root.');
    exitCode = 2;
    return;
  }

  final pubspecText = pubspec.readAsStringSync();
  for (final package in _forbiddenPackages) {
    if (RegExp('^\\s{2}$package\\s*:', multiLine: true).hasMatch(pubspecText)) {
      failures.add('Forbidden network package in pubspec.yaml: $package');
    }
  }

  final manifestText = manifest.readAsStringSync();
  if (manifestText.contains('android.permission.INTERNET')) {
    failures.add('The release Android manifest must not request INTERNET.');
  }
  if (!manifestText.contains('android:allowBackup="false"')) {
    failures.add('The release Android manifest must disable Android backups.');
  }
  if (!manifestText.contains('android:usesCleartextTraffic="false"')) {
    failures.add(
      'The release Android manifest must disallow cleartext traffic.',
    );
  }

  if (infoPlist.readAsStringSync().contains('NSAllowsArbitraryLoads')) {
    failures.add('The iOS Info.plist must not permit arbitrary network loads.');
  }

  if (failures.isNotEmpty) {
    for (final failure in failures) {
      stderr.writeln('FAIL: $failure');
    }
    exitCode = 1;
    return;
  }

  stdout.writeln('Offline policy check passed.');
}
