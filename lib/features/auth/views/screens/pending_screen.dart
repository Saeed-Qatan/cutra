import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_models/auth_view_model.dart';
import '../widgets/common/auth_status_card.dart';

/// Screen displayed when user registration is awaiting admin approval.
class PendingScreen extends ConsumerWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBusy =
        ref.watch(authViewModelProvider).valueOrNull?.isSubmitting ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Account Pending')),
      body: AuthStatusCard(
        message: 'Your account is pending admin approval',
        actions: [
          OutlinedButton(
            onPressed: isBusy
                ? null
                : () => ref
                      .read(authViewModelProvider.notifier)
                      .refreshSession(),
            child: const Text('Refresh status'),
          ),
          TextButton(
            onPressed: isBusy
                ? null
                : () => ref.read(authViewModelProvider.notifier).logout(),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
