import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_models/auth_view_model.dart';
import '../widgets/common/auth_status_card.dart';

/// Screen displayed when user registration has been rejected.
class RejectedScreen extends ConsumerWidget {
  const RejectedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBusy =
        ref.watch(authViewModelProvider).valueOrNull?.isSubmitting ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Account Rejected')),
      body: AuthStatusCard(
        message: 'Your account request has been rejected',
        actions: [
          TextButton(
            onPressed: isBusy
                ? null
                : () => ref.read(authViewModelProvider.notifier).logout(),
            child: const Text('Back to login'),
          ),
        ],
      ),
    );
  }
}
