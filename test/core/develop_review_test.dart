import 'package:cutra/core/errors/exceptions.dart';
import 'package:cutra/core/network/dio_api_client.dart';
import 'package:cutra/core/storage/shared_prefs_service.dart';
import 'package:cutra/core/widgets/app_error_widget.dart';
import 'package:cutra/core/widgets/app_loading_indicator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewMockPreferences extends Mock implements SharedPreferences {}

class ReviewMockDio extends Mock implements Dio {}

void main() {
  group('Storage failure regressions', () {
    late ReviewMockPreferences prefs;
    late SharedPrefsService service;

    setUp(() {
      prefs = ReviewMockPreferences();
      service = SharedPrefsService(prefs);
    });

    test('writeString reports a false persistence result', () async {
      when(
        () => prefs.setString('theme', 'dark'),
      ).thenAnswer((_) async => false);
      await expectLater(
        service.writeString('theme', 'dark'),
        throwsA(isA<CacheException>()),
      );
    });

    test('writeInt reports a false persistence result', () async {
      when(() => prefs.setInt('count', 7)).thenAnswer((_) async => false);
      await expectLater(
        service.writeInt('count', 7),
        throwsA(isA<CacheException>()),
      );
    });

    test('writeBool reports a false persistence result', () async {
      when(() => prefs.setBool('enabled', true)).thenAnswer((_) async => false);
      await expectLater(
        service.writeBool('enabled', true),
        throwsA(isA<CacheException>()),
      );
    });

    test('delete reports a false persistence result', () async {
      when(() => prefs.remove('theme')).thenAnswer((_) async => false);
      await expectLater(
        service.delete('theme'),
        throwsA(isA<CacheException>()),
      );
    });

    test('clear reports a false persistence result', () async {
      when(() => prefs.clear()).thenAnswer((_) async => false);
      await expectLater(service.clear(), throwsA(isA<CacheException>()));
    });

    test('platform write exceptions become CacheException', () async {
      when(
        () => prefs.setString('theme', 'dark'),
      ).thenThrow(StateError('platform failure'));
      await expectLater(
        service.writeString('theme', 'dark'),
        throwsA(isA<CacheException>()),
      );
    });
  });

  group('Network mutations', () {
    for (final method in ['post', 'put', 'delete']) {
      test(
        '$method forwards body, query and headers and returns response',
        () async {
          final dio = ReviewMockDio();
          final client = DioApiClient(dio: dio);
          final body = <String, dynamic>{'id': 7};
          final query = <String, dynamic>{'mode': 'review'};
          final headers = <String, String>{'X-Review': 'true'};
          final response = Response<dynamic>(
            requestOptions: RequestOptions(path: '/items'),
            data: <String, dynamic>{'ok': true},
          );
          switch (method) {
            case 'post':
              when(
                () => dio.post<dynamic>(
                  '/items',
                  data: body,
                  queryParameters: query,
                  options: any(named: 'options'),
                ),
              ).thenAnswer((_) async => response);
            case 'put':
              when(
                () => dio.put<dynamic>(
                  '/items',
                  data: body,
                  queryParameters: query,
                  options: any(named: 'options'),
                ),
              ).thenAnswer((_) async => response);
            case 'delete':
              when(
                () => dio.delete<dynamic>(
                  '/items',
                  data: body,
                  queryParameters: query,
                  options: any(named: 'options'),
                ),
              ).thenAnswer((_) async => response);
          }
          final result = switch (method) {
            'post' => await client.post(
              '/items',
              data: body,
              queryParameters: query,
              headers: headers,
            ),
            'put' => await client.put(
              '/items',
              data: body,
              queryParameters: query,
              headers: headers,
            ),
            _ => await client.delete(
              '/items',
              data: body,
              queryParameters: query,
              headers: headers,
            ),
          };
          expect(result, response.data);
          final captured = switch (method) {
            'post' => verify(
              () => dio.post<dynamic>(
                '/items',
                data: body,
                queryParameters: query,
                options: captureAny(named: 'options'),
              ),
            ),
            'put' => verify(
              () => dio.put<dynamic>(
                '/items',
                data: body,
                queryParameters: query,
                options: captureAny(named: 'options'),
              ),
            ),
            _ => verify(
              () => dio.delete<dynamic>(
                '/items',
                data: body,
                queryParameters: query,
                options: captureAny(named: 'options'),
              ),
            ),
          };
          expect((captured.captured.single as Options).headers, headers);
        },
      );
    }
  });

  testWidgets('error widget triggers retry and displays message', (
    tester,
  ) async {
    var retries = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppErrorWidget(message: 'Failed', onRetry: () => retries++),
        ),
      ),
    );
    expect(find.text('Failed'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    expect(retries, 1);
  });

  testWidgets('loading widget shows spinner and message', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppLoadingIndicator(message: 'Loading')),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Loading'), findsOneWidget);
  });
}
