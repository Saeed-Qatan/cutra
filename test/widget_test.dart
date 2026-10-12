// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cutra/app/router/auth_status.dart';
import 'package:cutra/core/providers/core_providers.dart';
import 'package:cutra/main.dart';
import 'package:cutra/features/auth/view_models/splash_view_model.dart';

class _FinishedSplash extends SplashViewModel {
  _FinishedSplash() {
    state = true;
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesInstanceProvider.overrideWithValue(prefs),
        splashViewModelProvider.overrideWith((ref) => _FinishedSplash()),
      ],
    );
    addTearDown(container.dispose);

    // Set authenticated so GoRouter routes to HomeScreen
    container
        .read(authStatusProvider.notifier)
        .setStatus(AuthStatus.authenticated);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const MyApp()),
    );
    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
