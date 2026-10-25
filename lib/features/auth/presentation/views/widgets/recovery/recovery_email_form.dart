import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/utils/app_validators.dart';
import '../../../../../../core/widgets/common/custom_button.dart';
import '../../../../../../core/widgets/common/custom_snackbar.dart';

/// E-mail form matching the compact recovery design.
class RecoveryEmailForm extends StatefulWidget {
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;
  final ValueChanged<String> onSubmit;

  const RecoveryEmailForm({
    super.key,
    required this.isSubmitting,
    required this.isSuccess,
    this.error,
    required this.onSubmit,
  });

  @override
  State<RecoveryEmailForm> createState() => _RecoveryEmailFormState();
}

class _RecoveryEmailFormState extends State<RecoveryEmailForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'نسيت كلمة المرور؟',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        const Gutter.small(),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: const Text(
              'أدخل البريد الإلكتروني المعتمد لورشتك للتحقق من صيغته. إرسال الرمز سيتاح بعد ربط الخدمة.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                height: 1.6,
                color: AppColors.onSurfaceMuted,
              ),
            ),
          ),
        ),
        const Gutter(scaleFactor: 1.5),
        if (widget.error != null) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3F1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0x4DD92D20)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 18,
                  color: AppColors.error,
                ),
                const Gutter.small(),
                Expanded(
                  child: Text(
                    widget.error!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gutter(),
        ],
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 8,
                runSpacing: 4,
                children: [
                  Text(
                    'البريد الإلكتروني للورشة',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                  Text(
                    'name@workshop.com',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 11,
                      color: AppColors.onSurfaceMuted,
                    ),
                  ),
                ],
              ),
              const Gutter.custom(size: 6),
              Semantics(
                label: 'البريد الإلكتروني للورشة',
                child: TextFormField(
                  controller: _emailController,
                  enabled: !widget.isSubmitting && !widget.isSuccess,
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.email],
                  autocorrect: false,
                  validator: AppValidators.email,
                  onFieldSubmitted: (_) => _submit(),
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    color: AppColors.ink,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'workshop@cutra-glass.com',
                    hintStyle: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      size: 18,
                      color: AppColors.onSurfaceMuted,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    errorMaxLines: 2,
                  ),
                ),
              ),
              const Gutter(),
              CustomButton(
                text: widget.isSuccess ? 'تعديل البريد' : 'التحقق من البريد',
                isLoading: widget.isSubmitting,
                trailingIcon: widget.isSuccess
                    ? null
                    : const Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Colors.white,
                      ),
                onPressed: widget.isSubmitting ? null : _submit,
              ),
            ],
          ),
        ),
        if (widget.isSuccess) ...[
          const Gutter(),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F9F4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFB7E2CC)),
            ),
            child: const Row(
              children: [
                Icon(Icons.check_circle_outline, color: AppColors.success),
                Gutter.small(),
                Expanded(
                  child: Text(
                    'صيغة البريد صحيحة. لم يُرسل رابط استعادة بعد.',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.onSurfaceMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  void _submit() {
    if (widget.isSubmitting) return;
    if (widget.isSuccess) {
      widget.onSubmit(_emailController.text.trim());
      return;
    }
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_emailController.text.trim());
    } else {
      CustomSnackbar.error(context, 'يرجى إدخال بريد إلكتروني صالح');
    }
  }
}
