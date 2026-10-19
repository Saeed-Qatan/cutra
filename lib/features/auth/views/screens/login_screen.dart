import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/theme/light_theme.dart';
import '../../view_models/auth_view_model.dart';
import '../widgets/common/grid_background_painter.dart';
import '../widgets/common/technical_corner_marks.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/login_identity.dart';

/// Top-level Login screen coordinating ViewModel actions and rendering LoginForm.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginViewModelProvider);
    final isSubmitting = login.isSubmitting;
    final errorMessage = login.failure?.message;

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
                                padding: const EdgeInsets.symmetric(
                                  vertical: 32,
                                ),
                                child: !login.isSuccess
                                    ? LoginForm(
                                        isSubmitting: isSubmitting,
                                        errorMessage: errorMessage,
                                        onSubmit: ref
                                            .read(
                                              loginViewModelProvider.notifier,
                                            )
                                            .submit,
                                        onForgotPassword: () =>
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'خدمة استعادة كلمة المرور غير متاحة حاليًا',
                                                ),
                                              ),
                                            ),
                                      )
                                    : Column(
                                        children: [
                                          const Icon(
                                            Icons.check_circle_outline,
                                            size: 42,
                                          ),
                                          const Gap(12),
                                          const Text('تم تسجيل الدخول'),
                                          const Gap(16),
                                          TextButton.icon(
                                            onPressed: isSubmitting
                                                ? null
                                                : () => ref
                                                      .read(
                                                        loginViewModelProvider
                                                            .notifier,
                                                      )
                                                      .reset(),
                                            icon: const Icon(Icons.logout),
                                            label: const Text('تسجيل الخروج'),
                                          ),
                                          if (errorMessage != null)
                                            Text(errorMessage),
                                        ],
                                      ),
                              ),
                              const LoginFooter(),
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
      ),
    );
  }
}
