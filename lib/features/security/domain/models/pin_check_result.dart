class PinCheckResult {
  const PinCheckResult({required this.verified, this.lockedUntilUtc, this.failedAttempts = 0});
  final bool verified;
  final DateTime? lockedUntilUtc;
  final int failedAttempts;
}
