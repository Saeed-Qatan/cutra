import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/extensions.dart';

/// Private sub-widget for displaying counter description and count value
class CounterDisplayWidget extends StatelessWidget {
  final int count;

  const CounterDisplayWidget({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(AppStrings.counterDescription),
        const SizedBox(height: 8),
        Text(
          '$count',
          style: context.textTheme.headlineMedium,
        ),
      ],
    );
  }
}
