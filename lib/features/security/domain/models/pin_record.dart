class PinRecord {
  final String salt;
  final String hash;
  final int failedAttempts;
  final DateTime? lockedUntilUtc;

  const PinRecord({
    required this.salt,
    required this.hash,
    this.failedAttempts = 0,
    this.lockedUntilUtc,
  });

  PinRecord copyWith({int? failedAttempts, DateTime? lockedUntilUtc, bool clearLock = false}) =>
      PinRecord(
        salt: salt,
        hash: hash,
        failedAttempts: failedAttempts ?? this.failedAttempts,
        lockedUntilUtc: clearLock ? null : lockedUntilUtc ?? this.lockedUntilUtc,
      );
}
