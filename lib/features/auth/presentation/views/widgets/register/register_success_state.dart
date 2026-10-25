import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Displayed inside [RegisterScreen] after local form validation.
///
/// No request is sent to the backend at this stage.
/// Navigation logic stays in the screen layer to preserve SoC.
class RegisterSuccessState extends StatelessWidget {
  final VoidCallback onEditTap;
  final VoidCallback onLoginTap;

  const RegisterSuccessState({
    super.key,
    required this.onEditTap,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(32),
        const Icon(
          Icons.check_circle_outline,
          size: 48,
          color: Color(0xFF219653),
        ),
        const Gap(12),
        const Text(
          'اكتمل التحقق من بيانات الورشة محليًا',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Gap(8),
        const Text(
          'لم يُرسل طلب التسجيل بعد. سيتاح الإرسال بعد ربط الخدمة.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
        ),
        const Gap(24),
        TextButton.icon(
          onPressed: onEditTap,
          icon: const Icon(Icons.edit_outlined),
          label: const Text('تعديل البيانات'),
        ),
        TextButton(
          onPressed: onLoginTap,
          child: const Text('العودة لصفحة الدخول'),
        ),
      ],
    );
  }
}
