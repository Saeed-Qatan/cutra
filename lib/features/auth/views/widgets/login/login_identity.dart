import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/colors.dart';

/// Branding header block specific to the Login page.
class LoginIdentity extends StatelessWidget {
  const LoginIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    const metadata = TextStyle(
      fontFamily: 'monospace',
      fontSize: 11,
      color: Color(0xFF8E8E8E),
    );
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8, bottom: 12),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox.square(
                    dimension: 6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFF2F80ED),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Gap(6),
                  Text('AUTH-PORTAL', style: metadata),
                ],
              ),
              Text('VER. 1.0', style: metadata),
            ],
          ),
        ),
        const Gap(24),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E5E5)),
          ),
          child: SvgPicture.asset(
            AppAssets.appIcon,
            width: 56,
            height: 56,
            semanticsLabel: 'Cutra app icon',
          ),
        ),
        const Gap(8),
        const Text(
          'Cutra',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        const Gap(6),
        const SizedBox(
          width: 24,
          height: 2,
          child: ColoredBox(color: Color(0xFFE5E5E5)),
        ),
      ],
    );
  }
}

/// Technical footer specific to the Login page.
class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: const Column(
        children: [
          Directionality(
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
