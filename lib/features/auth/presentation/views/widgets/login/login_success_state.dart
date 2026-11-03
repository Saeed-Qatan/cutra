import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/constants/colors.dart';

/// Full-screen success state widget displayed after successful login validation.
class LoginSuccessState extends StatelessWidget {
  /// Called when the user taps the reset button.
  final VoidCallback? onReset;

  /// Optional error message to display below the success content.
  final String? errorMessage;

  const LoginSuccessState({super.key, this.onReset, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.check_circle_outline,
          size: 42,
          color: AppColors.primary,
        ),
        const Gap(12),
        const Text(
          'اكتمل التحقق من البيانات محليًا',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
        const Gap(8),
        const Text(
          'لم يتم تسجيل الدخول إلى الخادم بعد',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: AppColors.onSurfaceMuted),
        ),
        const Gap(16),
        TextButton.icon(
          onPressed: onReset,
          icon: const Icon(Icons.arrow_back),
          label: const Text('العودة لنموذج الدخول'),
        ),
        if (errorMessage != null) ...[
          const Gap(8),
          Text(
            errorMessage!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ],
    );
  }
}
