import '../../../../../core/errors/failures.dart';

/// Presentation state for the Login form submission and feedback.
class LoginState {
  final bool isSubmitting;
  final bool isSuccess;
  final Failure? failure;

  const LoginState({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.failure,
  });
}

/// Presentation state for the Register form submission and feedback.
class RegisterState {
  final bool isSubmitting;
  final bool isSuccess;
  final Failure? failure;

  const RegisterState({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.failure,
  });
}
