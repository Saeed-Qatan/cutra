import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Reusable card displaying an authentication account status message with actions.
class AuthStatusCard extends StatelessWidget {
  final String message;
  final List<Widget> actions;

  const AuthStatusCard({
    super.key,
    required this.message,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(16),
            ...actions,
          ],
        ),
      ),
    );
  }
}
