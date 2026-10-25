import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/widgets/common/custom_button.dart';
import '../../../../../../core/widgets/common/custom_text_field.dart';
import '../../../../../../core/widgets/common/custom_snackbar.dart';
import '../../../../../../core/utils/app_validators.dart';
import '../../../../domain/models/auth_models.dart';

/// Presentation form specific to user login with validation and submission feedback.
class LoginForm extends StatefulWidget {
  final bool isSubmitting;
  final String? errorMessage;
  final Future<void> Function(LoginModel credentials) onSubmit;
  final VoidCallback onForgotPassword;

  const LoginForm({
    super.key,
    required this.isSubmitting,
    this.errorMessage,
    required this.onSubmit,
    required this.onForgotPassword,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'مرحبًا بعودتك',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 26),
            ),
            const Gap(4),
            Text(
              'سجّل الدخول للوصول إلى أدوات التقطيع الخاصة بورشتك',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF666666),
                height: 1.6,
              ),
            ),
            const Gap(24),
            CustomTextField(
              label: 'البريد الإلكتروني',
              hintText: 'أدخل البريد الإلكتروني',
              prefixIcon: Icons.mail_outline,
              enabled: !widget.isSubmitting,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const [
                AutofillHints.username,
                AutofillHints.email,
              ],
              validator: AppValidators.email,
            ),
            const Gap(16),
            CustomTextField(
              label: 'كلمة المرور',
              hintText: 'أدخل كلمة المرور',
              prefixIcon: Icons.lock_outline,
              enabled: !widget.isSubmitting,
              controller: _passwordController,
              isPassword: true,
              autofillHints: const [AutofillHints.password],
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              validator: AppValidators.password,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: widget.isSubmitting ? null : widget.onForgotPassword,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF666666),
                ),
                child: const Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            if (widget.errorMessage != null) ...[
              const Gap(12),
              Text(
                widget.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const Gap(8),
            CustomButton(
              text: 'التحقق من بيانات الدخول',
              isLoading: widget.isSubmitting,
              trailingIcon: const Icon(
                Icons.arrow_back,
                textDirection: TextDirection.ltr,
                size: 18,
                color: Colors.white,
              ),
              onPressed: widget.isSubmitting ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (widget.isSubmitting) return;
    if (!_formKey.currentState!.validate()) {
      CustomSnackbar.error(context, 'يرجى تصحيح بيانات الدخول');
      return;
    }
    await widget.onSubmit(
      LoginModel(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
