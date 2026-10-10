import 'package:flutter_test/flutter_test.dart';
import 'package:cutra/core/errors/exceptions.dart';
import 'package:cutra/core/errors/failures.dart';
import 'package:cutra/core/errors/error_handler.dart';

void main() {
  group('ErrorHandler tests', () {
    test('should map ServerException to ServerFailure', () {
      const exception = ServerException('Server error', statusCode: 500, code: '500');
      final failure = ErrorHandler.handle(exception);

      expect(failure, isA<ServerFailure>());
      expect(failure.message, equals('Server error'));
      expect((failure as ServerFailure).statusCode, equals(500));
    });

    test('should map CacheException to CacheFailure', () {
      const exception = CacheException('Cache write error');
      final failure = ErrorHandler.handle(exception);

      expect(failure, isA<CacheFailure>());
      expect(failure.message, equals('Cache write error'));
    });

    test('should map AuthException to AuthFailure', () {
      const exception = AuthException('Unauthorized access');
      final failure = ErrorHandler.handle(exception);

      expect(failure, isA<AuthFailure>());
      expect(failure.message, equals('Unauthorized access'));
    });

    test('should map unknown exception to UnknownFailure', () {
      final failure = ErrorHandler.handle('Unknown string error');

      expect(failure, isA<UnknownFailure>());
      expect(failure.message, contains('Unknown string error'));
    });
  });
}
