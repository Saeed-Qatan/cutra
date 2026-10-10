import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';

/// Rejected account screen.
class RejectedScreen extends ConsumerWidget {
  const RejectedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBusy =
        ref.watch(authControllerProvider).valueOrNull?.isSubmitting ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Account Rejected')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Your account request has been rejected'),
              const SizedBox(height: 16),
              TextButton(
                onPressed: isBusy
                    ? null
                    : () => ref.read(authControllerProvider.notifier).logout(),
                child: const Text('Back to login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
