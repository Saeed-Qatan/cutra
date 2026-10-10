/// Base class for all domain layer failures.
abstract class Failure {
  /// Human readable error message for UI layer
  final String message;

  /// Unique error identifier code
  final String? code;

  const Failure(this.message, {this.code});

  @override
  String toString() => '$runtimeType(message: $message, code: $code)';
}

/// Server or API failure representation for UI.
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(super.message, {super.code, this.statusCode});
}

/// Local storage failure representation for UI.
class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.code});
}

/// Network connectivity failure representation for UI.
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection available']);
}

/// Authentication failure representation for UI.
class AuthFailure extends Failure {
  const AuthFailure(super.message, {super.code});
}

/// Unknown unexpected failure representation for UI.
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred']);
}
