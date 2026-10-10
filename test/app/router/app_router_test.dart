import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cutra/app/router/auth_status.dart';
import 'package:cutra/core/providers/core_providers.dart';
import 'package:cutra/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  testWidgets('Unauthenticated status redirects to LoginScreen', (
    WidgetTester tester,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [sharedPreferencesInstanceProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    container
        .read(authStatusProvider.notifier)
        .setStatus(AuthStatus.unauthenticated);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const MyApp()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Login Screen'), findsOneWidget);
  });

  testWidgets('Pending status redirects to PendingScreen', (
    WidgetTester tester,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [sharedPreferencesInstanceProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    container.read(authStatusProvider.notifier).setStatus(AuthStatus.pending);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const MyApp()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Your account is pending admin approval'), findsOneWidget);
  });

  testWidgets('Authenticated status routes to HomeScreen', (
    WidgetTester tester,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [sharedPreferencesInstanceProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    container
        .read(authStatusProvider.notifier)
        .setStatus(AuthStatus.authenticated);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const MyApp()),
    );
    await tester.pumpAndSettle();

    // HomeScreen shows counter starting at 0
    expect(find.text('0'), findsOneWidget);
  });
}
