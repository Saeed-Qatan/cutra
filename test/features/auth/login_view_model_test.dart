import 'dart:async';

import 'package:cutra/core/errors/failures.dart';
import 'package:cutra/core/network/api_client.dart';
import 'package:cutra/features/auth/data/auth_services.dart';
import 'package:cutra/features/auth/models/auth_models.dart';
import 'package:cutra/features/auth/view_models/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _FakeApiClient implements ApiClient {
  @override
  Future delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) => throw UnimplementedError();

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) => throw UnimplementedError();

  @override
  Future post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) => throw UnimplementedError();

  @override
  Future put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) => throw UnimplementedError();
}

class _MockLoginService extends LoginService {
  _MockLoginService() : super(_FakeApiClient());

  final completion = Completer<Either<Failure, dynamic>>();
  int calls = 0;
  LoginModel? input;

  @override
  Future<Either<Failure, dynamic>> login(LoginModel credentials) {
    calls++;
    input = credentials;
    return completion.future;
  }
}

void main() {
  late ProviderContainer container;
  late _MockLoginService repository;

  setUp(() {
    repository = _MockLoginService();
    container = ProviderContainer(
      overrides: [
        loginServiceProvider.overrideWithValue(repository),
      ],
    );
    container.listen(loginViewModelProvider, (_, _) {});
  });
  tearDown(() => container.dispose());

  test('Invalid credentials never reach the login service', () async {
    await container
        .read(loginViewModelProvider.notifier)
        .submit(const LoginModel(email: 'invalid', password: 'secret'));
    expect(repository.calls, 0);
    expect(container.read(loginViewModelProvider).failure, isNotNull);
  });

  test(
    'Trims email, preserves password, and sets isSuccess on Right response',
    () async {
      repository.completion.complete(right({'token': 'test-token'}));
      await container
          .read(loginViewModelProvider.notifier)
          .submit(
            const LoginModel(email: ' user@example.com ', password: ' secret '),
          );
      expect(repository.input!.email, 'user@example.com');
      expect(repository.input!.password, ' secret ');
      expect(container.read(loginViewModelProvider).isSuccess, isTrue);
      expect(container.read(loginViewModelProvider).isSubmitting, isFalse);
    },
  );

  test(
    'Repeated submission makes only one request and reports Left failure',
    () async {
      final viewModel = container.read(loginViewModelProvider.notifier);
      final pending = viewModel.submit(
        const LoginModel(email: 'user@example.com', password: 'secret'),
      );
      await Future<void>.delayed(Duration.zero);
      await viewModel.submit(
        const LoginModel(email: 'user@example.com', password: 'secret'),
      );
      expect(repository.calls, 1);
      expect(container.read(loginViewModelProvider).isSubmitting, isTrue);

      repository.completion.complete(
        left(const AuthFailure('بيانات الدخول غير صحيحة')),
      );
      await pending;
      expect(
        container.read(loginViewModelProvider).failure!.message,
        'بيانات الدخول غير صحيحة',
      );
      expect(container.read(loginViewModelProvider).isSubmitting, isFalse);
      expect(container.read(loginViewModelProvider).isSuccess, isFalse);
    },
  );

  test(
    'Completion after leaving Login does not update disposed notifier',
    () async {
      final pending = container
          .read(loginViewModelProvider.notifier)
          .submit(
            const LoginModel(email: 'user@example.com', password: 'secret'),
          );
      await Future<void>.delayed(Duration.zero);
      container.invalidate(loginViewModelProvider);
      repository.completion.complete(right({'token': 'ok'}));
      await pending;
      expect(container.read(loginViewModelProvider).isSuccess, isFalse);
    },
  );
}
