import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../view_models/otp_verification_view_model.dart';

/// Renders the countdown timer and reactive resend code action with isolated state rebuilds.
class OtpResendTimer extends ConsumerWidget {
  const OtpResendTimer({super.key});

  /// Formats the integer second count into standard mm:ss display notation.
  String _formatDuration(int seconds) {
    final mins = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(
      otpVerificationNotifierProvider.select((s) => s.resendCountdown),
    );
    final canResend = ref.watch(
      otpVerificationNotifierProvider.select((s) => s.canResend),
    );

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.schedule, size: 18, color: AppColors.secondary),
            const Gutter.custom(size: 6),
            const Text(
              'إعادة المحاولة خلال:',
              style: TextStyle(fontSize: 13, color: AppColors.onSurfaceMuted),
            ),
            const Gutter.custom(size: 6),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                _formatDuration(countdown),
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: canResend
              ? () => ref
                    .read(otpVerificationNotifierProvider.notifier)
                    .resendCode()
              : null,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: AppColors.primary,
            disabledForegroundColor: AppColors.outline,
          ),
          child: const Text(
            'إعادة بدء المعاينة',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
