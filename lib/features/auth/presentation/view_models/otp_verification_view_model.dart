import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'otp_verification_state.dart';

/// Provider exposing the [OtpVerificationViewModel] for OTP screens.
final otpVerificationNotifierProvider =
    NotifierProvider.autoDispose<
      OtpVerificationViewModel,
      OtpVerificationState
    >(OtpVerificationViewModel.new);

/// Backward-compatible alias for the legacy provider name.
@Deprecated('Use otpVerificationNotifierProvider instead')
final otpVerificationViewModelProvider = otpVerificationNotifierProvider;

/// Manages OTP verification input, countdown timer, and submission flow.
class OtpVerificationViewModel extends Notifier<OtpVerificationState> {
  static const String demoCode = '123456';

  Timer? _timer;
  bool _active = true;

  @override
  OtpVerificationState build() {
    _active = true;
    ref.onDispose(() {
      _active = false;
      _timer?.cancel();
    });
    _startCountdown();
    return const OtpVerificationState();
  }

  /// Updates the entire code directly (e.g. from system autofill or controller).
  void setCode(String code) {
    final sanitized = code.replaceAll(RegExp(r'\D'), '');
    final trimmed = sanitized.length > OtpVerificationState.maxDigits
        ? sanitized.substring(0, OtpVerificationState.maxDigits)
        : sanitized;
    if (trimmed == state.code) return;
    state = state.copyWith(code: trimmed, clearError: true);
  }

  /// Clears all entered digits.
  void clearCode() {
    state = state.copyWith(code: '', clearError: true);
  }

  /// Submits the 6-digit OTP code for verification.
  Future<void> submit() async {
    if (!state.isComplete || state.isSubmitting) return;

    state = state.copyWith(isSubmitting: true, clearError: true);

    // Local preview only. Replace with the recovery API when its contract exists.
    await Future.delayed(const Duration(milliseconds: 900));

    if (!_active) return;

    if (state.code == demoCode) {
      state = state.copyWith(isSubmitting: false, isSuccess: true);
    } else {
      state = state.copyWith(
        isSubmitting: false,
        error: 'رمز المعاينة غير صحيح. استخدم 123456.',
      );
    }
  }

  /// Requests a fresh OTP code and resets the countdown timer.
  Future<void> resendCode() async {
    if (!state.canResend) return;

    state = state.copyWith(isSubmitting: true, clearError: true, code: '');

    // Local preview only; no message is sent until the recovery API exists.
    await Future.delayed(const Duration(milliseconds: 600));

    if (!_active) return;

    state = state.copyWith(isSubmitting: false, resendCountdown: 105);
    _startCountdown();
  }

  /// Initializes the 1-second countdown periodic timer.
  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_active) {
        timer.cancel();
        return;
      }
      if (state.resendCountdown <= 1) {
        timer.cancel();
        state = state.copyWith(resendCountdown: 0);
      } else {
        state = state.copyWith(resendCountdown: state.resendCountdown - 1);
      }
    });
  }
}
