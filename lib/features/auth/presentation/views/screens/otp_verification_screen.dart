import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/theme/light_theme.dart';
import '../../../../../core/utils/awesome_snackbar_extensions.dart';
import '../../view_models/otp_verification_view_model.dart';
import '../widgets/common/grid_background_painter.dart';
import '../widgets/common/technical_corner_marks.dart';
import '../widgets/otp/otp_app_bar.dart';
import '../widgets/otp/otp_info_card.dart';
import '../widgets/otp/otp_input_card.dart';
import '../widgets/otp/otp_security_badge.dart';
import '../widgets/otp/otp_submit_button.dart';

/// Screen coordinating the OTP verification console flow.
class OtpVerificationScreen extends ConsumerWidget {
  final String recipientEmail;

  const OtpVerificationScreen({super.key, required this.recipientEmail});

  void _handleBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.passwordRecovery);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(otpVerificationNotifierProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        context.showErrorSnackbar(next.error!);
      } else if (next.isSuccess && previous?.isSuccess != true) {
        context.showSuccessSnackbar('نجحت معاينة التحقق المحلية');
        GoRouter.maybeOf(context)?.go(AppRoutes.login);
      }
    });

    final isSubmitting = ref.watch(
      otpVerificationNotifierProvider.select((s) => s.isSubmitting),
    );
    final isSuccess = ref.watch(
      otpVerificationNotifierProvider.select((s) => s.isSuccess),
    );
    final code = ref.watch(
      otpVerificationNotifierProvider.select((s) => s.code),
    );
    return Theme(
      data: lightTheme.copyWith(
        colorScheme: lightTheme.colorScheme.copyWith(surface: AppColors.white),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            const Positioned.fill(
              child: CustomPaint(
                painter: GridBackgroundPainter(color: Color(0x0900439B)),
              ),
            ),
            const TechnicalCornerMarks(),
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              OtpAppBar(
                                title: 'رمز التحقق',
                                onBack: () => _handleBack(context),
                              ),
                              const Gutter(scaleFactor: 1.5),
                              OtpInfoCard(
                                recipientEmail: recipientEmail,
                                onEditPressed: () => _handleBack(context),
                              ),
                              const Gutter(),
                              OtpInputCard(
                                code: code,
                                enabled: !isSubmitting && !isSuccess,
                              ),
                              const Gutter(scaleFactor: 1.25),
                              const OtpSubmitButton(),
                              const Gutter(scaleFactor: 2),
                              const OtpSecurityBadge(),
                              const Gutter.small(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
