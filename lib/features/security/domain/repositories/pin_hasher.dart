import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:mahalli/features/security/domain/models/pin_record.dart';

class PinHasher {
  PinHasher({this.iterations = 210000});
  final int iterations;

  List<int> newSalt() {
    final random = Random.secure();
    return List<int>.generate(16, (_) => random.nextInt(256));
  }

  Future<String> hash(String pin, List<int> salt) async {
    final key = await Pbkdf2.hmacSha256(
      iterations: iterations,
      bits: 256,
    ).deriveKeyFromPassword(password: pin, nonce: salt);
    return base64Encode(await key.extractBytes());
  }

  Future<bool> matches(String pin, PinRecord record) async {
    final actual = base64Decode(await hash(pin, base64Decode(record.salt)));
    final expected = base64Decode(record.hash);
    if (actual.length != expected.length) return false;
    var difference = 0;
    for (var i = 0; i < actual.length; i++) {
      difference |= actual[i] ^ expected[i];
    }
    return difference == 0;
  }
}
