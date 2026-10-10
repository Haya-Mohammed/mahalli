import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/security/domain/models/pin_record.dart';

import '../domain/repositories/pin_store.dart';

class SecurePinStore implements PinStore {
  const SecurePinStore(this.storage);
  final FlutterSecureStorage storage;
  static const _key = 'mahalli_pin_v1';

  @override
  Future<PinRecord?> read() async {
    try {
      final raw = await storage.read(key: _key);
      if (raw == null) return null;
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final until = data['lockedUntilUtc'] as int?;
      return PinRecord(
        salt: data['salt'] as String,
        hash: data['hash'] as String,
        failedAttempts: data['failedAttempts'] as int? ?? 0,
        lockedUntilUtc: until == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(until, isUtc: true),
      );
    } catch (_) {
      throw const StorageFailure('Unable to read PIN data');
    }
  }

  @override
  Future<void> write(PinRecord record) async {
    try {
      await storage.write(
        key: _key,
        value: jsonEncode({
          'salt': record.salt,
          'hash': record.hash,
          'failedAttempts': record.failedAttempts,
          'lockedUntilUtc': record.lockedUntilUtc?.millisecondsSinceEpoch,
        }),
      );
    } catch (_) {
      throw const StorageFailure('Unable to save PIN data');
    }
  }

  @override
  Future<void> delete() async {
    try {
      await storage.delete(key: _key);
    } catch (_) {
      throw const StorageFailure('Unable to remove PIN data');
    }
  }
}
