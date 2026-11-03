import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../view_models/otp_verification_view_model.dart';
import 'otp_resend_timer.dart';
import 'otp_slots_input.dart';

/// Card container holding the OTP input fields and resend timer.
class OtpInputCard extends ConsumerWidget {
  /// The current code entered by the user.
  final String code;

  /// Whether the input fields are active for user interaction.
  final bool enabled;

  const OtpInputCard({super.key, required this.code, required this.enabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outline.withAlpha(50)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x06000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OtpSlotsInput(
              code: code,
              enabled: enabled,
              onCodeChanged: (v) =>
                  ref.read(otpVerificationNotifierProvider.notifier).setCode(v),
              onCompleted: () =>
                  ref.read(otpVerificationNotifierProvider.notifier).submit(),
            ),
            const Gutter(),
            const OtpResendTimer(),
          ],
        ),
      ),
    );
  }
}
