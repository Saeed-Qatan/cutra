import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/constants/colors.dart';

/// Title header for the Register screen derived from HTML specification.
class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'إنشاء حساب جديد',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
            height: 1.2,
          ),
        ),
        const Gap(4),
        const Text(
          'أدخل بيانات الورشة للتحقق منها محليًا',
          style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
        ),
      ],
    );
  }
}

/// Technical footer for the Register screen with login navigation and engine spec.
class RegisterFooter extends StatelessWidget {
  final VoidCallback onLoginTap;

  const RegisterFooter({super.key, required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                'لديك حساب بالفعل؟',
                style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
              const Gap(6),
              TextButton(
                onPressed: onLoginTap,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  minimumSize: Size(48, 48),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: const Text('تسجيل الدخول'),
              ),
            ],
          ),
          const Gap(8),
          const Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              'WORKSHOP SPEC V1.0  ·  CUTRA ENGINE',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 10,
                color: Color(0xFF9CA3AF),
                letterSpacing: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
