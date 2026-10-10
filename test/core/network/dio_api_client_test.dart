import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:cutra/core/network/dio_api_client.dart';
import 'package:cutra/core/errors/exceptions.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('DioApiClient tests', () {
    late MockDio mockDio;
    late DioApiClient client;

    setUp(() {
      mockDio = MockDio();
      client = DioApiClient(dio: mockDio);
    });

    test('get should return data when response is successful', () async {
      final response = Response<dynamic>(
        data: <String, dynamic>{'status': 'ok'},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      );

      when(() => mockDio.get<dynamic>(
            '/test',
            queryParameters: null,
            options: any(named: 'options'),
          )).thenAnswer((_) async => response);

      final result = await client.get('/test');

      expect(result, equals(<String, dynamic>{'status': 'ok'}));
    });

    test('get should throw ServerException when Dio throws DioException', () async {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          statusCode: 404,
          statusMessage: 'Not Found',
          requestOptions: RequestOptions(path: '/test'),
        ),
        type: DioExceptionType.badResponse,
      );

      when(() => mockDio.get<dynamic>(
            '/test',
            queryParameters: null,
            options: any(named: 'options'),
          )).thenThrow(dioException);

      expect(
        () => client.get('/test'),
        throwsA(isA<ServerException>().having(
          (e) => e.statusCode,
          'statusCode',
          equals(404),
        )),
      );
    });
  });
}
