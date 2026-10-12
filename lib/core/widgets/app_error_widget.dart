import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Reusable central error widget with optional retry action.
class AppErrorWidget extends StatelessWidget {
  /// Error display message
  final String message;

  /// Optional retry callback
  final VoidCallback? onRetry;

  /// Label for retry button
  final String retryLabel;

  const AppErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.retryLabel = 'Retry',
  });

  @override
  Widget build(BuildContext context) {
    final retryAction = onRetry;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const Gap(16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (retryAction != null) ...<Widget>[
              const Gap(20),
              ElevatedButton.icon(
                onPressed: retryAction,
                icon: const Icon(Icons.refresh),
                label: Text(retryLabel),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
