import 'package:cutra/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cutra/core/constants/app_strings.dart';
import 'package:cutra/core/providers/core_providers.dart';
import 'package:cutra/core/theme/dark_theme.dart';
import 'package:cutra/core/theme/light_theme.dart';

/// Orchestrates application initialization and pre-flight service assembly.
class AppBootstrapper {
  AppBootstrapper._();

  /// Initializes asynchronous platform dependencies prior to widget execution.
  static Future<List<Override>> initServices() async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreferences = await SharedPreferences.getInstance();

    return [
      sharedPreferencesInstanceProvider.overrideWithValue(sharedPreferences),
    ];
  }

  /// Bootstraps the application environment and runs the root [CutraApp].
  static Future<void> bootstrap() async {
    final overrides = await initServices();

    runApp(ProviderScope(overrides: overrides, child: const CutraApp()));
  }
}

/// Root widget of the Cutra application.
class CutraApp extends ConsumerWidget {
  const CutraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      // Global RTL layout direction for the entire app.
      // Individual widgets that require LTR (e.g. OTP input, email fields)
      // override this locally with their own Directionality(ltr).
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}

/// Backward-compatible alias for the legacy root widget.
typedef MyApp = CutraApp;
