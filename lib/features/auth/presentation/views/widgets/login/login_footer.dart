import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Technical footer specific to the Login page.
///
/// [onRegisterTap] is called when the user taps the register link.
/// Navigation logic stays in the caller to preserve SoC.
class LoginFooter extends StatelessWidget {
  final VoidCallback? onRegisterTap;

  const LoginFooter({super.key, this.onRegisterTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'ليس لديك حساب؟',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF666666),
                  fontSize: 13,
                ),
              ),
              TextButton(
                onPressed: onRegisterTap,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF2F80ED),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('إنشاء حساب'),
              ),
            ],
          ),
          const Gap(4),
          const Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              'PRECISION ENGINE  ·  SAAS',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: Color(0xFF8E8E8E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
