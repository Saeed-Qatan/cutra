import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/constants/app_assets.dart';

/// Center identity block displaying the Cutra logo, brand name, divider, and tagline.
class SplashIdentityBlock extends StatelessWidget {
  const SplashIdentityBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _LogoContainer(),
        Gap(32),
        _BrandTitle(),
        Gap(12),
        _PrecisionDivider(),
        Gap(14),
        _ArabicTagline(),
      ],
    );
  }
}

class _LogoContainer extends StatelessWidget {
  const _LogoContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 96,
          height: 96,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E5E5)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              AppAssets.appIcon,
              semanticsLabel: 'Cutra app icon',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const Positioned(left: -8, bottom: -8, child: _AccentDot()),
      ],
    );
  }
}

class _AccentDot extends StatelessWidget {
  const _AccentDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Color(0xFF2F80ED),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _BrandTitle extends StatelessWidget {
  const _BrandTitle();

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
        'Cutra',
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 36,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.08,
          color: Color(0xFF111111),
          height: 1.0,
        ),
      ),
    );
  }
}

class _PrecisionDivider extends StatelessWidget {
  const _PrecisionDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 2,
      decoration: BoxDecoration(
        color: const Color(0x1A111111),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}

class _ArabicTagline extends StatelessWidget {
  const _ArabicTagline();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'دقة في كل قطعة',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xFF666666),
        height: 1.3,
      ),
    );
  }
}
