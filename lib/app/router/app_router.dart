import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/screens/login_screen.dart';
import '../../features/auth/presentation/views/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/views/screens/password_recovery_screen.dart';
import '../../features/auth/presentation/views/screens/register_screen.dart';
import '../../features/auth/presentation/splash/view_models/splash_view_model.dart';
import '../../features/auth/presentation/splash/views/screens/splash_screen.dart';
import 'app_routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final splashFinished = ref.watch(splashViewModelProvider);
  final router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
      GoRoute(
        path: AppRoutes.register,
        builder: (_, _) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.passwordRecovery,
        builder: (_, _) => const PasswordRecoveryScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        builder: (_, state) =>
            OtpVerificationScreen(recipientEmail: state.extra as String? ?? ''),
      ),
    ],
    redirect: (_, state) {
      if (!splashFinished) {
        return state.matchedLocation == AppRoutes.splash
            ? null
            : AppRoutes.splash;
      }
      if (state.matchedLocation == AppRoutes.register ||
          state.matchedLocation == AppRoutes.passwordRecovery ||
          state.matchedLocation == AppRoutes.otpVerification) {
        return null;
      }
      return state.matchedLocation == AppRoutes.login ? null : AppRoutes.login;
    },
  );
  ref.onDispose(router.dispose);
  return router;
});
