import '../../../../core/errors/failures.dart';

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

/// Form input validators for authentication credentials.
abstract final class LoginValidators {
  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'أدخل البريد الإلكتروني';
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
      return 'أدخل بريدًا إلكترونيًا صالحًا';
    }
    return null;
  }

  static String? password(String? value) {
    return value == null || value.trim().isEmpty ? 'أدخل كلمة المرور' : null;
  }
}
