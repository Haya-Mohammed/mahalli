import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/features/security/data/pin_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PinGateStatus { loading, offer, locked, unlocked, failure }

class PinState {
  const PinState({
    this.status = PinGateStatus.loading,
    this.enabled = false,
    this.busy = false,
    this.failedAttempts = 0,
    this.lockedUntilUtc,
    this.error = false,
  });
  final PinGateStatus status;
  final bool enabled;
  final bool busy;
  final int failedAttempts;
  final DateTime? lockedUntilUtc;
  final bool error;
}

class PinCubit extends Cubit<PinState> {
  PinCubit(this.service, this.prefs) : super(const PinState());
  final PinService service;
  final SharedPreferences prefs;
  static const _offerSeenKey = 'pin_offer_seen';

  Future<void> load() async {
    emit(const PinState());
    try {
      final enabled = await service.isEnabled();
      emit(
        PinState(
          status: enabled
              ? PinGateStatus.locked
              : prefs.getBool(_offerSeenKey) == true
              ? PinGateStatus.unlocked
              : PinGateStatus.offer,
          enabled: enabled,
        ),
      );
    } catch (_) {
      emit(const PinState(status: PinGateStatus.failure));
    }
  }

  Future<void> skipOffer() async {
    try {
      await prefs.setBool(_offerSeenKey, true);
      emit(const PinState(status: PinGateStatus.unlocked));
    } catch (_) {
      emit(const PinState(status: PinGateStatus.failure));
    }
  }

  Future<bool> setPin(String pin) async {
    if (state.busy) return false;
    emit(PinState(status: state.status, enabled: state.enabled, busy: true));
    try {
      await service.setPin(pin);
      try {
        await prefs.setBool(_offerSeenKey, true);
      } catch (_) {
        // The PIN itself is already in secure storage.
      }
      emit(const PinState(status: PinGateStatus.unlocked, enabled: true));
      return true;
    } catch (_) {
      emit(PinState(status: state.status, enabled: state.enabled, error: true));
      return false;
    }
  }

  Future<bool> unlock(String pin) async {
    if (state.busy) return false;
    emit(
      PinState(
        status: PinGateStatus.locked,
        enabled: true,
        busy: true,
        lockedUntilUtc: state.lockedUntilUtc,
      ),
    );
    try {
      final result = await service.verify(pin);
      emit(
        PinState(
          status: result.verified ? PinGateStatus.unlocked : PinGateStatus.locked,
          enabled: true,
          failedAttempts: result.failedAttempts,
          lockedUntilUtc: result.lockedUntilUtc,
          error: !result.verified,
        ),
      );
      return result.verified;
    } catch (_) {
      emit(const PinState(status: PinGateStatus.failure, enabled: true));
      return false;
    }
  }

  Future<bool> changePin(String current, String replacement) async {
    if (state.busy) return false;
    emit(PinState(status: state.status, enabled: true, busy: true));
    try {
      final result = await service.changePin(current, replacement);
      emit(
        PinState(
          status: state.status,
          enabled: true,
          error: !result.verified,
          lockedUntilUtc: result.lockedUntilUtc,
          failedAttempts: result.failedAttempts,
        ),
      );
      return result.verified;
    } catch (_) {
      emit(PinState(status: state.status, enabled: true, error: true));
      return false;
    }
  }

  Future<bool> disablePin(String current) async {
    if (state.busy) return false;
    emit(PinState(status: state.status, enabled: true, busy: true));
    try {
      final result = await service.disablePin(current);
      emit(
        PinState(
          status: state.status,
          enabled: !result.verified,
          error: !result.verified,
          lockedUntilUtc: result.lockedUntilUtc,
          failedAttempts: result.failedAttempts,
        ),
      );
      return result.verified;
    } catch (_) {
      emit(PinState(status: state.status, enabled: true, error: true));
      return false;
    }
  }

  void lock() {
    if (state.enabled && state.status == PinGateStatus.unlocked) {
      emit(const PinState(status: PinGateStatus.locked, enabled: true));
    }
  }
}
