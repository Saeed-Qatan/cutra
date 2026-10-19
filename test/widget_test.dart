import 'package:cutra/core/providers/core_providers.dart';
import 'package:cutra/features/auth/splash/view_models/splash_view_model.dart';
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
  testWidgets('App opens Login after Splash', (tester) async {
    SharedPreferences.setMockInitialValues({});
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
  });
}
