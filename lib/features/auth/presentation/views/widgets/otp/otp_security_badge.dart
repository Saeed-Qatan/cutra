import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../../../core/constants/colors.dart';

/// Local-preview disclosure shown until the recovery backend is connected.
class OtpSecurityBadge extends StatelessWidget {
  const OtpSecurityBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.lock_outline, size: 15, color: AppColors.primary),
          Gutter.custom(size: 6),
          Flexible(
            child: Text(
              'وضع معاينة محلي — لا يوجد اتصال بخادم المصادقة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: AppColors.onSurfaceMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
