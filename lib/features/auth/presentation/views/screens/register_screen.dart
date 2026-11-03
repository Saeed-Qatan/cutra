import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/app_routes.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/theme/light_theme.dart';
import '../../../../../core/utils/awesome_snackbar_extensions.dart';
import '../../view_models/auth_view_model.dart';
import '../widgets/common/grid_background_painter.dart';
import '../widgets/common/technical_corner_marks.dart';
import '../widgets/register/register_footer.dart';
import '../widgets/register/register_form.dart';
import '../widgets/register/register_header.dart';
import '../widgets/register/register_success_state.dart';

/// Screen coordinating the workshop registration workflow.
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerViewModelProvider);
    ref.listen(registerViewModelProvider, (previous, next) {
      if (next.failure != null && previous?.failure != next.failure) {
        context.showErrorSnackbar(next.failure!.message);
      } else if (next.isSuccess && previous?.isSuccess != true) {
        context.showSuccessSnackbar('اكتمل التحقق من بيانات الورشة محليًا');
      }
    });

    return Theme(
      data: lightTheme.copyWith(
        colorScheme: lightTheme.colorScheme.copyWith(surface: AppColors.white),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            tooltip: 'العودة إلى تسجيل الدخول',
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => context.go(AppRoutes.login),
          ),
        ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: (constraints.maxHeight - 48).clamp(
                            0,
                            double.infinity,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const RegisterHeader(),
                                const Gap(14),
                                Offstage(
                                  offstage: state.isSuccess,
                                  child: RegisterForm(
                                    isSubmitting: state.isSubmitting,
                                    errorMessage: state.failure?.message,
                                    onSubmit: ref
                                        .read(
                                          registerViewModelProvider.notifier,
                                        )
                                        .submit,
                                  ),
                                ),
                                if (state.isSuccess)
                                  RegisterSuccessState(
                                    onEditTap: () => ref
                                        .read(
                                          registerViewModelProvider.notifier,
                                        )
                                        .reset(),
                                    onLoginTap: () =>
                                        context.go(AppRoutes.login),
                                  ),
                              ],
                            ),
                            const Gap(36),
                            RegisterFooter(
                              onLoginTap: () => context.go(AppRoutes.login),
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
