import 'package:cutra/features/auth/presentation/splash/view_models/splash_view_model.dart';
import 'package:cutra/features/auth/presentation/splash/views/screens/splash_screen.dart';
import 'package:cutra/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the full splash identity for five seconds', (
    tester,
  ) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SplashScreen()),
      ),
    );

    expect(find.text('Cutra'), findsOneWidget);
    expect(find.text('دقة في كل قطعة'), findsOneWidget);
    expect(find.text('أداة هندسية لتقطيع الزجاج'), findsOneWidget);
    expect(container.read(splashViewModelProvider), isFalse);

    await tester.pump(const Duration(seconds: 4));
    expect(container.read(splashViewModelProvider), isFalse);

    await tester.pump(const Duration(seconds: 1));
    expect(container.read(splashViewModelProvider), isTrue);
  });

  testWidgets('routes to login after the splash interval', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    expect(find.text('Cutra'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    expect(find.text('مرحبًا بعودتك'), findsOneWidget);
  });
}
