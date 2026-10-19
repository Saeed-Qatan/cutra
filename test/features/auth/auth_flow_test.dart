import 'package:cutra/core/errors/failures.dart';
import 'package:cutra/core/network/api_client.dart';
import 'package:cutra/features/auth/data/auth_services.dart';
import 'package:cutra/features/auth/models/auth_models.dart';
import 'package:cutra/features/auth/view_models/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginModel', () {
    test('LoginModel serializes to JSON', () {
      const model = LoginModel(email: 'user@example.com', password: 'secret');
      expect(model.toJson(), {
        'email': 'user@example.com',
        'password': 'secret',
      });
    });

    test('LoginModel deserializes from JSON', () {
      final model = LoginModel.fromJson({
        'email': 'user@example.com',
        'password': 'secret',
      });
      expect(model.email, 'user@example.com');
      expect(model.password, 'secret');
    });
  });

  group('AuthServices with fpdart', () {
    test('login sends request and returns Right on success', () async {
      final apiClient = FakeApiClient(response: {'token': 'access-token'});
      final service = AuthServices(apiClient);

      final result = await service.login(
        const LoginModel(email: 'user@example.com', password: 'secret'),
      );

      expect(result.isRight(), isTrue);
      expect(apiClient.lastPath, '/auth/login');
      expect(apiClient.lastData, <String, dynamic>{
        'email': 'user@example.com',
        'password': 'secret',
      });
    });

    test('login returns Left on API failure', () async {
      final apiClient = FakeApiClient(throwError: true);
      final service = AuthServices(apiClient);

      final result = await service.login(
        const LoginModel(email: 'user@example.com', password: 'secret'),
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<Failure>()),
        (_) => fail('Expected Left'),
      );
    });
  });

  group('LoginViewModel flow', () {
    test('successful login sets isSuccess to true', () async {
      final apiClient = FakeApiClient(response: {'token': 'access-token'});
      final service = AuthServices(apiClient);
      final container = ProviderContainer(
        overrides: [
          authServicesProvider.overrideWithValue(service),
        ],
      );
      addTearDown(container.dispose);

      final viewModel = container.read(loginViewModelProvider.notifier);
      await viewModel.submit(
        const LoginModel(email: 'user@example.com', password: 'secret'),
      );

      final state = container.read(loginViewModelProvider);
      expect(state.isSuccess, isTrue);
      expect(state.isSubmitting, isFalse);
      expect(state.failure, isNull);
    });
  });
}

class FakeApiClient implements ApiClient {
  final dynamic response;
  final bool throwError;
  String? lastPath;
  dynamic lastData;

  FakeApiClient({this.response, this.throwError = false});

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    lastPath = path;
    if (throwError) throw Exception('Network error');
    return response;
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    lastPath = path;
    lastData = data;
    if (throwError) throw Exception('Network error');
    return response;
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async => throw UnimplementedError();

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async => throw UnimplementedError();
}
