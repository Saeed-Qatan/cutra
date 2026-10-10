/// Base class for all application exceptions.
abstract class AppException implements Exception {
  /// User-friendly or debug message
  final String message;

  /// Optional error code from server or platform
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => '$runtimeType(message: $message, code: $code)';
}

/// Network communication exception (HTTP 4xx, 5xx, timeout, no internet).
class ServerException extends AppException {
  /// HTTP status code if available
  final int? statusCode;

  const ServerException(super.message, {super.code, this.statusCode});
}

/// Local storage read/write exception.
class CacheException extends AppException {
  const CacheException(super.message, {super.code});
}

/// Authentication or authorization exception.
class AuthException extends AppException {
  const AuthException(super.message, {super.code});
}

/// Data validation exception.
class ValidationException extends AppException {
  const ValidationException(super.message, {super.code});
}
