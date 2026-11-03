import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../../../core/constants/colors.dart';
import '../common/grid_background_painter.dart';

/// Hero information card displaying the security badge, prompt, and masked contact pill.
class OtpInfoCard extends StatelessWidget {
  final String recipientEmail;
  final VoidCallback? onEditPressed;

  const OtpInfoCard({
    super.key,
    required this.recipientEmail,
    this.onEditPressed,
  });

  String get _maskedRecipient {
    final parts = recipientEmail.split('@');
    if (parts.length != 2 || parts.first.isEmpty || parts.last.isEmpty) {
      return recipientEmail.isEmpty
          ? 'البريد الإلكتروني المدخل'
          : recipientEmail;
    }
    return '${parts.first[0]}•••@${parts.last}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outline.withAlpha(50)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(
              painter: GridBackgroundPainter(color: Color(0x0800439B)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                _buildSecurityBadge(),
                const Gutter.small(),
                const Text(
                  'أدخل رمز التحقق',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const Gutter.custom(size: 6),
                const SizedBox(
                  width: 290,
                  child: Text(
                    'هذه معاينة محلية ولم يُرسل رمز فعلي. استخدم الرمز 123456:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: AppColors.onSurfaceMuted,
                    ),
                  ),
                ),
                const Gutter(),
                _buildRecipientPill(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityBadge() {
    return SizedBox.square(
      dimension: 64,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.dialpad,
              size: 32,
              color: AppColors.primary,
            ),
          ),
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.lock, size: 13, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipientPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(12),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.email_outlined,
              size: 18,
              color: AppColors.primary,
            ),
            const Gutter.custom(size: 8),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                _maskedRecipient,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const Gutter.custom(size: 10),
            Container(
              width: 1,
              height: 16,
              color: AppColors.outline.withAlpha(120),
            ),
            const Gutter.custom(size: 8),
            InkWell(
              onTap: onEditPressed,
              borderRadius: BorderRadius.circular(6),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  children: [
                    Text(
                      'تعديل',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.edit_outlined,
                      size: 14,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
