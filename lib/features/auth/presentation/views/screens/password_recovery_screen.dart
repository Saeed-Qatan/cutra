import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/theme/light_theme.dart';
import '../../../../../core/widgets/common/custom_snackbar.dart';
import '../../view_models/password_recovery_view_model.dart';
import '../widgets/common/grid_background_painter.dart';
import '../widgets/common/technical_corner_marks.dart';
import '../widgets/recovery/recovery_email_form.dart';

/// E-mail recovery entry screen; sending a code awaits backend integration.
class PasswordRecoveryScreen extends ConsumerWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(passwordRecoveryViewModelProvider);
    ref.listen(passwordRecoveryViewModelProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        CustomSnackbar.error(context, next.error!);
      } else if (next.isSuccess && previous?.isSuccess != true) {
        CustomSnackbar.success(context, 'تم التحقق من صيغة البريد محليًا');
      }
    });
    final viewModel = ref.read(passwordRecoveryViewModelProvider.notifier);

    return Theme(
      data: lightTheme.copyWith(
        colorScheme: lightTheme.colorScheme.copyWith(surface: AppColors.white),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
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
                            padding: EdgeInsets.all(context.gutter * 1.5),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox.square(
                                        dimension: 48,
                                        child: IconButton(
                                          tooltip: 'العودة لتسجيل الدخول',
                                          style: IconButton.styleFrom(
                                            backgroundColor: AppColors.white,
                                            side: const BorderSide(
                                              color: AppColors.outline,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          icon: const Icon(Icons.arrow_forward),
                                          onPressed: () =>
                                              context.go(AppRoutes.login),
                                        ),
                                      ),
                                      const Expanded(
                                        child: Text(
                                          'استعادة كلمة المرور',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.ink,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 48),
                                    ],
                                  ),
                                  const Gutter(scaleFactor: 1.5),
                                  Expanded(
                                    child: Center(
                                      child: RecoveryEmailForm(
                                        isSubmitting: state.isSubmitting,
                                        isSuccess: state.isSuccess,
                                        error: state.error,
                                        onSubmit: state.isSuccess
                                            ? (_) => viewModel.reset()
                                            : viewModel.submit,
                                      ),
                                    ),
                                  ),
                                  const Gutter(scaleFactor: 1.5),
                                  Center(
                                    child: TextButton.icon(
                                      onPressed: () =>
                                          context.go(AppRoutes.login),
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                      ),
                                      label: const Text('العودة لتسجيل الدخول'),
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.reserved,
                                        textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
