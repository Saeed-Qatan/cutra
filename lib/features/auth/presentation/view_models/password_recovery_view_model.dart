import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_validators.dart';

/// Presentation state for the password recovery e-mail form.
class PasswordRecoveryState {
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  const PasswordRecoveryState({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });
}

final passwordRecoveryViewModelProvider =
    NotifierProvider.autoDispose<
      PasswordRecoveryViewModel,
      PasswordRecoveryState
    >(PasswordRecoveryViewModel.new);

/// Coordinates the single-step password recovery e-mail form.
///
/// No real API call is made; validates the e-mail locally and
/// simulates a success state to allow UI preview.
class PasswordRecoveryViewModel extends Notifier<PasswordRecoveryState> {
  bool _active = true;

  @override
  PasswordRecoveryState build() {
    _active = true;
    ref.onDispose(() => _active = false);
    return const PasswordRecoveryState();
  }

  /// Validates [email] locally and transitions to the success state.
  Future<void> submit(String email) async {
    if (state.isSubmitting || state.isSuccess) return;
    final error = AppValidators.email(email);
    if (error != null) {
      state = PasswordRecoveryState(error: error);
      return;
    }

    state = const PasswordRecoveryState(isSubmitting: true);

    // [TECH-DEBT]: Replace with real API call when backend is ready.
    await Future.delayed(const Duration(milliseconds: 900));

    if (!_active) return;
    state = const PasswordRecoveryState(isSuccess: true);
  }

  /// Resets to initial state so the user can try again.
  void reset() => state = const PasswordRecoveryState();
}
