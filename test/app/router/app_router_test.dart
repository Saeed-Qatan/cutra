import 'package:cutra/core/providers/core_providers.dart';
import 'package:cutra/features/auth/splash/view_models/splash_view_model.dart';
import 'package:cutra/features/auth/splash/views/screens/splash_screen.dart';
import 'package:cutra/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FinishedSplash extends SplashViewModel {
  @override
  bool build() {
    super.build();
    return true;
  }
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('Splash remains visible until its timer finishes', (
    tester,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesInstanceProvider.overrideWithValue(prefs),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pump();
    expect(find.byType(SplashScreen), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 4999));
    expect(find.byType(SplashScreen), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('مرحبًا بعودتك'), findsOneWidget);
  });

  testWidgets('Finished splash opens Login only', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesInstanceProvider.overrideWithValue(prefs),
          splashViewModelProvider.overrideWith(_FinishedSplash.new),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('مرحبًا بعودتك'), findsOneWidget);
    expect(find.text('إنشاء حساب'), findsNothing);
  });
}
