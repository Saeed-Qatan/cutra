import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/core_providers.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/pending_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/rejected_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/home/views/screens/home_screen.dart';
import 'app_routes.dart';
import 'auth_status.dart';

/// Provider for GoRouter configuration with Auth Guard
final goRouterProvider = Provider<GoRouter>((ref) {
  final authStatus = ref.watch(authStatusProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.pending,
        builder: (BuildContext context, GoRouterState state) =>
            const PendingScreen(),
      ),
      GoRoute(
        path: AppRoutes.rejected,
        builder: (BuildContext context, GoRouterState state) =>
            const RejectedScreen(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final loc = state.matchedLocation;

      switch (authStatus) {
        case AuthStatus.checking:
          if (loc != AppRoutes.splash) {
            return AppRoutes.splash;
          }
          return null;

        case AuthStatus.unauthenticated:
          if (loc != AppRoutes.login &&
              loc != AppRoutes.register &&
              loc != AppRoutes.splash) {
            return AppRoutes.login;
          }
          if (loc == AppRoutes.splash) {
            return AppRoutes.login;
          }
          return null;

        case AuthStatus.pending:
          if (loc != AppRoutes.pending) {
            return AppRoutes.pending;
          }
          return null;

        case AuthStatus.rejected:
          if (loc != AppRoutes.rejected) {
            return AppRoutes.rejected;
          }
          return null;

        case AuthStatus.authenticated:
          if (loc == AppRoutes.login ||
              loc == AppRoutes.register ||
              loc == AppRoutes.pending ||
              loc == AppRoutes.rejected ||
              loc == AppRoutes.splash) {
            return AppRoutes.home;
          }
          return null;
      }
    },
  );
});
