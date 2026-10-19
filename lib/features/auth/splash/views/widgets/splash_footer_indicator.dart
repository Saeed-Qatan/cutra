import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Renders status dots and technical architecture description at the bottom of Splash screen.
class SplashFooterIndicator extends StatelessWidget {
  const SplashFooterIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [_StatusDots(), Gap(10), _TechnicalDescription()],
    );
  }
}

class _StatusDots extends StatelessWidget {
  const _StatusDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _Dot(color: Color(0xFF2F80ED)),
        Gap(6),
        _Dot(color: Color(0xFFE5E5E5)),
        Gap(6),
        _Dot(color: Color(0xFFE5E5E5)),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _TechnicalDescription extends StatelessWidget {
  const _TechnicalDescription();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'أداة هندسية لتقطيع الزجاج',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: Color(0xFF8E8E8E),
        letterSpacing: 0.2,
      ),
    );
  }
}
