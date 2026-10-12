import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Reusable central loading indicator widget.
class AppLoadingIndicator extends StatelessWidget {
  /// Custom message under loading spinner
  final String? message;

  const AppLoadingIndicator({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final text = message;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CircularProgressIndicator(),
          if (text != null) ...<Widget>[
            const Gap(16),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
