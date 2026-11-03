import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';

/// Back navigation app bar row used exclusively in the OTP verification screen.
class OtpAppBar extends StatelessWidget {
  /// Title displayed in the center of the bar.
  final String title;

  /// Called when the user taps the back button.
  final VoidCallback onBack;

  const OtpAppBar({super.key, required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: 44,
          child: IconButton(
            tooltip: 'العودة',
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
              side: const BorderSide(color: AppColors.outline),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.arrow_forward),
            onPressed: onBack,
          ),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }
}
