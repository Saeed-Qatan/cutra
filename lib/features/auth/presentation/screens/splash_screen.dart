import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/app_loading_indicator.dart';
import '../controllers/auth_controller.dart';

/// Splash screen that triggers Auth session restoration.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: authState.when(
        loading: () => const AppLoadingIndicator(message: 'Checking session'),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(authControllerProvider),
        ),
        data: (state) {
          if (state.failure != null) {
            return AppErrorWidget(
              message: state.failure!.message,
              onRetry: () => ref.invalidate(authControllerProvider),
            );
          }
          return const AppLoadingIndicator(message: 'Opening Cutra');
        },
      ),
    );
  }
}
