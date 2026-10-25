import 'package:cutra/features/auth/presentation/view_models/password_recovery_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('rejects malformed email immediately', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.listen(passwordRecoveryViewModelProvider, (_, _) {});

    await container
        .read(passwordRecoveryViewModelProvider.notifier)
        .submit('bad');

    final state = container.read(passwordRecoveryViewModelProvider);
    expect(state.error, isNotNull);
    expect(state.isSuccess, isFalse);
  });

  test('accepts valid email locally, blocks repeats, and resets', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.listen(passwordRecoveryViewModelProvider, (_, _) {});

    final notifier = container.read(passwordRecoveryViewModelProvider.notifier);
    final first = notifier.submit('owner@example.com');
    final duplicate = notifier.submit('owner@example.com');
    expect(
      container.read(passwordRecoveryViewModelProvider).isSubmitting,
      isTrue,
    );
    await Future.wait([first, duplicate]);
    expect(container.read(passwordRecoveryViewModelProvider).isSuccess, isTrue);

    notifier.reset();
    expect(
      container.read(passwordRecoveryViewModelProvider).isSuccess,
      isFalse,
    );
  });

  test('does not update a disposed provider after validation delay', () async {
    final container = ProviderContainer();
    container.listen(passwordRecoveryViewModelProvider, (_, _) {});
    final pending = container
        .read(passwordRecoveryViewModelProvider.notifier)
        .submit('owner@example.com');
    container.dispose();

    await expectLater(pending, completes);
  });
}
