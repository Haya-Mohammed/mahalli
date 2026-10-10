import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('release configuration remains offline-first and private', () {
    final root = Directory.current.path;
    final pubspec = File(
      '$root${Platform.pathSeparator}pubspec.yaml',
    ).readAsStringSync();
    final manifest = File(
      '$root${Platform.pathSeparator}android${Platform.pathSeparator}app'
      '${Platform.pathSeparator}src${Platform.pathSeparator}main'
      '${Platform.pathSeparator}AndroidManifest.xml',
    ).readAsStringSync();
    final infoPlist = File(
      '$root${Platform.pathSeparator}ios${Platform.pathSeparator}Runner'
      '${Platform.pathSeparator}Info.plist',
    ).readAsStringSync();

    for (final package in const [
      'dio',
      'http',
      'firebase_core',
      'cloud_firestore',
      'firebase_auth',
    ]) {
      expect(
        RegExp('^\\s{2}$package\\s*:', multiLine: true).hasMatch(pubspec),
        isFalse,
        reason: '$package would violate the offline-first promise.',
      );
    }
    expect(manifest, isNot(contains('android.permission.INTERNET')));
    expect(manifest, contains('android:allowBackup="false"'));
    expect(manifest, contains('android:usesCleartextTraffic="false"'));
    expect(infoPlist, isNot(contains('NSAllowsArbitraryLoads')));
  });
}
