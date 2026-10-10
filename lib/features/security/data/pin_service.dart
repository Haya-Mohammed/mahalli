import 'dart:convert';
import 'dart:math';

import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/features/security/domain/models/pin_check_result.dart';
import 'package:mahalli/features/security/domain/models/pin_record.dart';
import 'package:mahalli/features/security/domain/repositories/pin_hasher.dart';
import 'package:mahalli/features/security/domain/repositories/pin_store.dart';

class PinService {
  final PinStore store;
  final PinHasher hasher;
  final DateTime Function() _now;

  PinService(this.store, this.hasher, {DateTime Function()? now}) : _now = now ?? DateTime.now;

  static String normalizePin(String value) => normalizeNumeric(value);

  static void validatePin(String value) {
    if (!RegExp(r'^\d{4,6}$').hasMatch(normalizePin(value))) {
      throw const ValidationFailure('PIN must contain 4 to 6 digits');
    }
  }

  Future<bool> isEnabled() async => await store.read() != null;

  Future<void> setPin(String pin) async {
    validatePin(pin);
    if (await isEnabled()) {
      throw const ValidationFailure('PIN is already enabled');
    }
    await store.write(await _newRecord(normalizePin(pin)));
  }

  Future<PinRecord> _newRecord(String pin) async {
    final salt = hasher.newSalt();
    return PinRecord(salt: base64Encode(salt), hash: await hasher.hash(pin, salt));
  }

  Future<PinCheckResult> verify(String pin) async {
    final record = await store.read();
    if (record == null) throw const ValidationFailure('PIN is not enabled');
    final now = _now().toUtc();
    final until = record.lockedUntilUtc;
    if (until != null && now.isBefore(until)) {
      return PinCheckResult(
        verified: false,
        lockedUntilUtc: until,
        failedAttempts: record.failedAttempts,
      );
    }
    final valid = await hasher.matches(normalizePin(pin), record);
    if (valid) {
      if (record.failedAttempts != 0 || until != null) {
        await store.write(record.copyWith(failedAttempts: 0, clearLock: true));
      }
      return const PinCheckResult(verified: true);
    }
    final attempts = record.failedAttempts + 1;
    DateTime? nextLock;
    if (attempts >= 5) {
      final seconds = min(1800, 30 * (1 << min(attempts - 5, 6)));
      nextLock = now.add(Duration(seconds: seconds));
    }
    await store.write(
      record.copyWith(
        failedAttempts: attempts,
        lockedUntilUtc: nextLock,
        clearLock: nextLock == null,
      ),
    );
    return PinCheckResult(verified: false, lockedUntilUtc: nextLock, failedAttempts: attempts);
  }

  Future<PinCheckResult> changePin(String currentPin, String newPin) async {
    validatePin(newPin);
    final check = await verify(currentPin);
    if (check.verified) {
      await store.write(await _newRecord(normalizePin(newPin)));
    }
    return check;
  }

  Future<PinCheckResult> disablePin(String currentPin) async {
    final check = await verify(currentPin);
    if (check.verified) await store.delete();
    return check;
  }
}
