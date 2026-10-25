import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/app_validators.dart';
import '../../domain/models/auth_models.dart';
import 'auth_state.dart';

export 'auth_state.dart';

/// Riverpod provider for transient login form state.
final loginViewModelProvider =
    NotifierProvider.autoDispose<LoginViewModel, LoginState>(
      LoginViewModel.new,
    );

/// Riverpod provider for transient register form state.
final registerViewModelProvider =
    NotifierProvider.autoDispose<RegisterViewModel, RegisterState>(
      RegisterViewModel.new,
    );

/// Manages local login form validation until backend integration is available.
class LoginViewModel extends Notifier<LoginState> {
  bool _active = true;

  @override
  LoginState build() {
    _active = true;
    ref.onDispose(() => _active = false);
    return const LoginState();
  }

  /// Validates input without creating a server session.
  Future<void> submit(LoginModel credentials) async {
    if (state.isSubmitting || state.isSuccess) return;

    final validation =
        AppValidators.email(credentials.email) ??
        AppValidators.password(credentials.password);
    if (validation != null) {
      state = LoginState(failure: AuthFailure(validation));
      return;
    }

    state = const LoginState(isSubmitting: true);
    await Future<void>.value();

    if (!_active) return;
    state = const LoginState(isSuccess: true);
  }

  /// Resets state back to initial state.
  void reset() {
    state = const LoginState();
  }
}

/// Manages local registration form validation until backend integration.
class RegisterViewModel extends Notifier<RegisterState> {
  bool _active = true;

  @override
  RegisterState build() {
    _active = true;
    ref.onDispose(() => _active = false);
    return const RegisterState();
  }

  /// Validates the form without sending a registration request.
  Future<void> submit(RegisterModel request) async {
    if (state.isSubmitting || state.isSuccess) return;

    final validation =
        AppValidators.required('اسم الورشة')(request.workshopName) ??
        AppValidators.phone(request.phone) ??
        AppValidators.email(request.email) ??
        AppValidators.required('عنوان الورشة')(request.address) ??
        AppValidators.strongPassword(request.password) ??
        AppValidators.passwordConfirmation(
          request.passwordConfirmation,
          request.password,
        );

    if (validation != null) {
      state = RegisterState(failure: AuthFailure(validation));
      return;
    }

    state = const RegisterState(isSubmitting: true);
    await Future<void>.value();

    if (!_active) return;
    state = const RegisterState(isSuccess: true);
  }

  /// Resets state back to initial state.
  void reset() {
    state = const RegisterState();
  }
}
