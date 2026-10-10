import 'package:flutter/material.dart';
import '../../features/home/views/screens/home_screen.dart';

/// Central AppRouter configuration
abstract class AppRouter {
  /// Home route path
  static const String home = '/';

  /// Route generator
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
