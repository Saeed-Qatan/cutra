import 'exceptions.dart';
import 'failures.dart';

/// Central helper for mapping low-level exceptions into domain failures.
abstract class ErrorHandler {
  /// Map an exception or object to a user-facing Failure
  static Failure handle(Object error) {
    if (error is ServerException) {
      return ServerFailure(
        error.message,
        code: error.code,
        statusCode: error.statusCode,
      );
    }

    if (error is CacheException) {
      return CacheFailure(
        error.message,
        code: error.code,
      );
    }

    if (error is AuthException) {
      return AuthFailure(
        error.message,
        code: error.code,
      );
    }

    if (error is AppException) {
      return UnknownFailure(error.message);
    }

    return UnknownFailure(error.toString());
  }
}
