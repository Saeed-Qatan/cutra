import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/theme/light_theme.dart';
import '../../../../../core/utils/awesome_snackbar_extensions.dart';
import '../../view_models/auth_view_model.dart';
import '../widgets/common/grid_background_painter.dart';
import '../widgets/common/technical_corner_marks.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/login_footer.dart';
import '../widgets/login/login_identity.dart';
import '../widgets/login/login_success_state.dart';

/// Top-level Login screen coordinating ViewModel actions and rendered sub-widgets.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginViewModelProvider);
    ref.listen(loginViewModelProvider, (previous, next) {
      if (next.failure != null && previous?.failure != next.failure) {
        context.showErrorSnackbar(next.failure!.message);
      } else if (next.isSuccess && previous?.isSuccess != true) {
        context.showSuccessSnackbar('اكتمل التحقق من البيانات محليًا');
      }
    });

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
                painter: GridBackgroundPainter(color: Color(0xFFF0F0F0)),
              ),
            ),
            const TechnicalCornerMarks(),
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: (constraints.maxHeight - 48).clamp(
                            0,
                            double.infinity,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const LoginIdentity(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: login.isSuccess
                                  ? LoginSuccessState(
                                      errorMessage: login.failure?.message,
                                      onReset: () => ref
                                          .read(loginViewModelProvider.notifier)
                                          .reset(),
                                    )
                                  : LoginForm(
                                      isSubmitting: login.isSubmitting,
                                      errorMessage: login.failure?.message,
                                      onSubmit: ref
                                          .read(loginViewModelProvider.notifier)
                                          .submit,
                                      onForgotPassword: () => context.go(
                                        AppRoutes.passwordRecovery,
                                      ),
                                    ),
                            ),
                            LoginFooter(
                              onRegisterTap: () =>
                                  context.go(AppRoutes.register),
                            ),
                          ],
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
