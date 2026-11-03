import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../view_models/otp_verification_view_model.dart';

/// Primary submit button for confirming the entered OTP code.
class OtpSubmitButton extends ConsumerWidget {
  const OtpSubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isComplete = ref.watch(
      otpVerificationNotifierProvider.select((s) => s.isComplete),
    );
    final isSubmitting = ref.watch(
      otpVerificationNotifierProvider.select((s) => s.isSubmitting),
    );

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: (isComplete && !isSubmitting)
            ? () => ref.read(otpVerificationNotifierProvider.notifier).submit()
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isComplete ? AppColors.primary : AppColors.ink,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: const Color(0xFFE5E2E1),
          disabledForegroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: isComplete ? 2 : 0,
        ),
        child: isSubmitting
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      'تأكيد الرمز والمتابعة',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.check_circle_outline, size: 20),
                ],
              ),
      ),
    );
  }
}
