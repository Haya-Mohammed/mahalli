import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/features/security/data/pin_service.dart';
import 'package:mahalli/features/security/domain/models/pin_record.dart';
import 'package:mahalli/features/security/domain/repositories/pin_hasher.dart';
import 'package:mahalli/features/security/domain/repositories/pin_store.dart';

class MemoryPinStore implements PinStore {
  PinRecord? record;

  @override
  Future<PinRecord?> read() async => record;

  @override
  Future<void> write(PinRecord value) async => record = value;

  @override
  Future<void> delete() async => record = null;
}

void main() {
  test('PIN is salted, locks after failures, and can be changed or disabled', () async {
    final store = MemoryPinStore();
    var now = DateTime.utc(2026, 10, 2, 12);
    final service = PinService(store, PinHasher(iterations: 100), now: () => now);

    await service.setPin('١٢٣٤');
    expect(store.record?.hash, isNot('1234'));
    expect(store.record?.salt, isNotEmpty);
    expect((await service.verify('1234')).verified, isTrue);

    for (var i = 0; i < 4; i++) {
      expect((await service.verify('9999')).verified, isFalse);
    }
    final locked = await service.verify('9999');
    expect(locked.lockedUntilUtc, now.add(const Duration(seconds: 30)));
    expect((await service.verify('1234')).verified, isFalse);

    now = now.add(const Duration(seconds: 31));
    expect((await service.verify('1234')).verified, isTrue);
    expect(store.record?.failedAttempts, 0);

    expect((await service.changePin('1234', '5678')).verified, isTrue);
    expect((await service.verify('1234')).verified, isFalse);
    expect((await service.disablePin('5678')).verified, isTrue);
    expect(await service.isEnabled(), isFalse);
  });
}
