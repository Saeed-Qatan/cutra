/// Shared form-field validators for use across the entire application.
///
/// Each method matches Flutter's [FormFieldValidator] signature:
/// returns `null` on valid input, or a localised error [String] on failure.
///
/// Usage:
/// ```dart
/// validator: AppValidators.email,
/// validator: AppValidators.required('اسم الورشة'),
/// validator: (v) => AppValidators.passwordConfirmation(v, _pwCtrl.text),
/// ```
abstract final class AppValidators {
  // ── Email ────────────────────────────────────────────────────────────────

  /// Validates that [value] is a non-empty, well-formed e-mail address.
  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'أدخل البريد الإلكتروني';
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
      return 'أدخل بريدًا إلكترونيًا صالحًا';
    }
    return null;
  }

  // ── Password ─────────────────────────────────────────────────────────────

  /// Validates that [value] is non-empty (login use-case — no length rule).
  static String? password(String? value) {
    final val = value ?? '';
    if (val.trim().isEmpty) return 'أدخل كلمة المرور';
    return null;
  }

  /// Validates that [value] is non-empty and at least 6 characters long
  /// (registration / password-change use-case).
  static String? strongPassword(String? value) {
    final val = value ?? '';
    if (val.isEmpty) return 'أدخل كلمة المرور';
    if (val.length < 6) return 'يجب ألا تقل كلمة المرور عن 6 أحرف';
    return null;
  }

  /// Validates that [value] matches [originalPassword].
  ///
  /// [value] is the confirmation field; [originalPassword] is the first entry.
  static String? passwordConfirmation(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) return 'أدخل تأكيد كلمة المرور';
    if (value != originalPassword) return 'كلمات المرور غير متطابقة';
    return null;
  }

  // ── Phone ────────────────────────────────────────────────────────────────

  /// Validates that [value] is a non-empty phone number.
  static String? phone(String? value) {
    final val = value?.trim() ?? '';
    if (val.isEmpty) return 'أدخل رقم الهاتف';
    return null;
  }

  /// Checks the format only; recovery-code verification requires the backend.
  static String? recoveryCode(String? value) {
    return RegExp(r'^[0-9]{6}$').hasMatch(value?.trim() ?? '')
        ? null
        : 'أدخل رمزًا من 6 أرقام';
  }

  // ── Generic ──────────────────────────────────────────────────────────────

  /// Returns a validator that ensures the field is non-empty.
  ///
  /// [fieldName] is shown in the error message, e.g. `required('اسم الورشة')`
  /// produces `'أدخل اسم الورشة'`.
  static String? Function(String?) required(String fieldName) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return 'أدخل $fieldName';
      return null;
    };
  }
}
