import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';

/// Pending approval screen.
class PendingScreen extends ConsumerWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBusy =
        ref.watch(authControllerProvider).valueOrNull?.isSubmitting ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Account Pending')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Your account is pending admin approval'),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: isBusy
                    ? null
                    : () => ref
                          .read(authControllerProvider.notifier)
                          .refreshSession(),
                child: const Text('Refresh status'),
              ),
              TextButton(
                onPressed: isBusy
                    ? null
                    : () => ref.read(authControllerProvider.notifier).logout(),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
