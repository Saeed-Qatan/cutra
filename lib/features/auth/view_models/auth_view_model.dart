import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failures.dart';
import '../data/auth_services.dart';
import '../models/auth_models.dart';
import 'auth_state.dart';

export 'auth_state.dart';

/// Riverpod provider for transient login form state.
final loginViewModelProvider =
    NotifierProvider.autoDispose<LoginViewModel, LoginState>(
      LoginViewModel.new,
    );

/// Manages interactive form validation and login action submission.
class LoginViewModel extends Notifier<LoginState> {
  bool _active = true;

  @override
  LoginState build() {
    _active = true;
    ref.onDispose(() => _active = false);
    return const LoginState();
  }

  /// Validates input credentials and calls the authentication service.
  Future<void> submit(LoginModel credentials) async {
    if (state.isSubmitting) return;

    final validation =
        LoginValidators.email(credentials.email) ??
        LoginValidators.password(credentials.password);
    if (validation != null) {
      state = LoginState(failure: AuthFailure(validation));
      return;
    }

    state = const LoginState(isSubmitting: true);

    final result = await ref
        .read(authServicesProvider)
        .login(
          LoginModel(
            email: credentials.email.trim(),
            password: credentials.password,
          ),
        );

    if (!_active) return;

    state = result.fold(
      (failure) => LoginState(failure: failure),
      (_) => const LoginState(isSuccess: true),
    );
  }

  /// Resets state back to initial state.
  void reset() {
    state = const LoginState();
  }
}
