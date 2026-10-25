import 'package:cutra/features/auth/domain/models/auth_models.dart';
import 'package:cutra/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
      container.listen(loginViewModelProvider, (_, _) {});
    });
    tearDown(() => container.dispose());

    test('rejects invalid credentials', () async {
      await container
          .read(loginViewModelProvider.notifier)
          .submit(const LoginModel(email: 'bad', password: 'secret'));
      final state = container.read(loginViewModelProvider);
      expect(state.isSuccess, isFalse);
      expect(state.failure?.message, isNotNull);
    });

    test('validates locally and resets', () async {
      final notifier = container.read(loginViewModelProvider.notifier);
      await notifier.submit(
        const LoginModel(email: 'user@example.com', password: 'secret'),
      );
      expect(container.read(loginViewModelProvider).isSuccess, isTrue);
      notifier.reset();
      expect(container.read(loginViewModelProvider).isSuccess, isFalse);
    });
  });

  group('RegisterViewModel', () {
    late ProviderContainer container;
    const request = RegisterModel(
      workshopName: 'Cutra',
      phone: '777123456',
      email: 'owner@example.com',
      address: 'Aden',
      password: 'secret1',
      passwordConfirmation: 'secret1',
    );

    setUp(() {
      container = ProviderContainer();
      container.listen(registerViewModelProvider, (_, _) {});
    });
    tearDown(() => container.dispose());

    test('rejects mismatched passwords', () async {
      await container
          .read(registerViewModelProvider.notifier)
          .submit(
            const RegisterModel(
              workshopName: 'Cutra',
              phone: '777123456',
              email: 'owner@example.com',
              address: 'Aden',
              password: 'secret1',
              passwordConfirmation: 'different',
            ),
          );
      final state = container.read(registerViewModelProvider);
      expect(state.isSuccess, isFalse);
      expect(state.failure?.message, isNotNull);
    });

    test('validates locally and resets', () async {
      final notifier = container.read(registerViewModelProvider.notifier);
      await notifier.submit(request);
      expect(container.read(registerViewModelProvider).isSuccess, isTrue);
      notifier.reset();
      expect(container.read(registerViewModelProvider).isSuccess, isFalse);
    });
  });
}
