/// Immutable state representation for the OTP verification workflow.
class OtpVerificationState {
  /// The currently entered 6-digit PIN code.
  final String code;

  /// Whether verification submission is in progress.
  final bool isSubmitting;

  /// Whether the code was verified successfully.
  final bool isSuccess;

  /// Error message, if verification or resend failed.
  final String? error;

  /// Remaining seconds before the user can request another code.
  final int resendCountdown;

  const OtpVerificationState({
    this.code = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.resendCountdown = 105,
  });

  /// Maximum length allowed for the OTP code.
  static const int maxDigits = 6;

  /// Whether all 6 digits have been supplied.
  bool get isComplete => code.length == maxDigits;

  /// Whether resending the code is currently allowed.
  bool get canResend => resendCountdown <= 0 && !isSubmitting;

  /// Creates a copy of this state with optionally replaced fields.
  OtpVerificationState copyWith({
    String? code,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
    bool clearError = false,
    int? resendCountdown,
  }) {
    return OtpVerificationState(
      code: code ?? this.code,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: clearError ? null : (error ?? this.error),
      resendCountdown: resendCountdown ?? this.resendCountdown,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtpVerificationState &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          isSubmitting == other.isSubmitting &&
          isSuccess == other.isSuccess &&
          error == other.error &&
          resendCountdown == other.resendCountdown;

  @override
  int get hashCode =>
      Object.hash(code, isSubmitting, isSuccess, error, resendCountdown);
}
