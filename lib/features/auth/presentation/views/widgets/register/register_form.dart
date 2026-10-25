import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/widgets/common/custom_button.dart';
import '../../../../../../core/widgets/common/custom_text_field.dart';
import '../../../../../../core/widgets/common/custom_snackbar.dart';
import '../../../../../../core/utils/app_validators.dart';
import '../../../../domain/models/auth_models.dart';

/// Presentation form for workshop registration derived from HTML design.
class RegisterForm extends StatefulWidget {
  final bool isSubmitting;
  final String? errorMessage;
  final Future<void> Function(RegisterModel request) onSubmit;

  const RegisterForm({
    super.key,
    required this.isSubmitting,
    this.errorMessage,
    required this.onSubmit,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _workshopNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fieldFocusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    _workshopNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    for (final node in _fieldFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildWorkshopField(),
          const Gap(10),
          CustomTextField(
            label: 'رقم الهاتف',
            hintText: 'أدخل رقم الهاتف',
            prefixIcon: Icons.phone_outlined,
            enabled: !widget.isSubmitting,
            controller: _phoneController,
            focusNode: _fieldFocusNodes[1],
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            validator: AppValidators.phone,
          ),
          const Gap(10),
          CustomTextField(
            label: 'البريد الإلكتروني',
            hintText: 'أدخل البريد الإلكتروني',
            prefixIcon: Icons.mail_outline,
            enabled: !widget.isSubmitting,
            controller: _emailController,
            focusNode: _fieldFocusNodes[2],
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: AppValidators.email,
          ),
          const Gap(10),
          CustomTextField(
            label: 'العنوان',
            hintText: 'أدخل عنوان الورشة',
            prefixIcon: Icons.location_on_outlined,
            enabled: !widget.isSubmitting,
            controller: _addressController,
            focusNode: _fieldFocusNodes[3],
            textInputAction: TextInputAction.next,
            validator: AppValidators.required('عنوان الورشة'),
          ),
          const Gap(10),
          _buildPasswordsRow(),
          if (widget.errorMessage != null) ...[
            const Gap(10),
            Text(
              widget.errorMessage!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const Gap(14),
          CustomButton(
            text: 'التحقق من بيانات الورشة',
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
    );
  }

  Widget _buildWorkshopField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          runSpacing: 4,
          children: const [
            Text(
              'اسم الورشة',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Text(
              'ACCOUNT_ID',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 10,
                color: Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
        const Gap(6),
        CustomTextField(
          label: 'اسم الورشة',
          showLabel: false,
          hintText: 'أدخل اسم الورشة',
          prefixIcon: Icons.storefront_outlined,
          enabled: !widget.isSubmitting,
          controller: _workshopNameController,
          focusNode: _fieldFocusNodes[0],
          textInputAction: TextInputAction.next,
          validator: AppValidators.required('اسم الورشة'),
        ),
      ],
    );
  }

  Widget _buildPasswordsRow() {
    final fields = <Widget>[
      CustomTextField(
        label: 'كلمة المرور',
        hintText: '••••••••',
        prefixIcon: Icons.lock_outline,
        isPassword: true,
        enabled: !widget.isSubmitting,
        controller: _passwordController,
        focusNode: _fieldFocusNodes[4],
        textInputAction: TextInputAction.next,
        validator: AppValidators.strongPassword,
      ),
      CustomTextField(
        label: 'تأكيد كلمة المرور',
        hintText: '••••••••',
        prefixIcon: Icons.lock_outline,
        isPassword: true,
        enabled: !widget.isSubmitting,
        controller: _confirmPasswordController,
        focusNode: _fieldFocusNodes[5],
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => _submit(),
        validator: (val) =>
            AppValidators.passwordConfirmation(val, _passwordController.text),
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final largeText = MediaQuery.textScalerOf(context).scale(13) > 16;
        if (constraints.maxWidth < 350 || largeText) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [fields[0], const Gap(10), fields[1]],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: fields[0]),
            const Gap(8),
            Expanded(child: fields[1]),
          ],
        );
      },
    );
  }

  Future<void> _submit() async {
    if (widget.isSubmitting) return;
    if (!_formKey.currentState!.validate()) {
      final validators = <String? Function(String?)>[
        AppValidators.required('اسم الورشة'),
        AppValidators.phone,
        AppValidators.email,
        AppValidators.required('عنوان الورشة'),
        AppValidators.strongPassword,
        (value) =>
            AppValidators.passwordConfirmation(value, _passwordController.text),
      ];
      final controllers = <TextEditingController>[
        _workshopNameController,
        _phoneController,
        _emailController,
        _addressController,
        _passwordController,
        _confirmPasswordController,
      ];
      for (var index = 0; index < validators.length; index++) {
        if (validators[index](controllers[index].text) == null) continue;
        final node = _fieldFocusNodes[index];
        node.requestFocus();
        final fieldContext = node.context;
        if (fieldContext != null) {
          Scrollable.ensureVisible(fieldContext, alignment: 0.2);
        }
        break;
      }
      CustomSnackbar.error(context, 'يرجى تصحيح بيانات التسجيل');
      return;
    }

    await widget.onSubmit(
      RegisterModel(
        workshopName: _workshopNameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        address: _addressController.text.trim(),
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
      ),
    );
  }
}
