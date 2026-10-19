import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/colors.dart';
import '../../theme/app_theme.dart';

/// Style variants supported by [CustomButton].
enum ButtonVariant {
  /// Dark solid button matching the primary brand color (AppColors.ink).
  primary,

  /// Muted solid button for secondary actions.
  secondary,

  /// Outlined button with transparent background.
  outline,
}

/// A reusable application-wide button conforming to Cutra engineering design system.
///
/// Features:
/// - Handles [isLoading] state with a proportional progress indicator.
/// - Supports [leadingIcon] and [trailingIcon] slots.
/// - Conforms to [AppSizes.button] and [AppSizes.radius] tokens.
/// - Disables user interaction safely during submission or when [onPressed] is null.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonVariant variant;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final double height;

  static const double _loadingSize = 20.0;
  static const double _loadingStroke = 2.0;
  static const double _iconSpacing = 8.0;
  static const double _borderWidth = 1.0;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.variant = ButtonVariant.primary,
    this.leadingIcon,
    this.trailingIcon,
    this.width = double.infinity,
    this.height = AppSizes.button,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = isLoading ? null : onPressed;
    final borderRadius = BorderRadius.circular(AppSizes.radius);

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: _resolveBackgroundColor(context),
        shape: _resolveShape(borderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: effectiveOnPressed,
          child: Center(
            child: isLoading
                ? _buildLoadingIndicator(context)
                : _buildContent(context),
          ),
        ),
      ),
    );
  }

  Color _resolveBackgroundColor(BuildContext context) {
    if (onPressed == null && !isLoading) {
      return AppColors.outline.withAlpha(100);
    }
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.ink;
      case ButtonVariant.secondary:
        return AppColors.surfaceMuted;
      case ButtonVariant.outline:
        return Colors.transparent;
    }
  }

  Color _resolveForegroundColor(BuildContext context) {
    if (onPressed == null && !isLoading) {
      return AppColors.onSurfaceMuted;
    }
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.white;
      case ButtonVariant.secondary:
      case ButtonVariant.outline:
        return AppColors.ink;
    }
  }

  ShapeBorder _resolveShape(BorderRadius borderRadius) {
    if (variant == ButtonVariant.outline) {
      return RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: const BorderSide(
          color: AppColors.outline,
          width: _borderWidth,
        ),
      );
    }
    return RoundedRectangleBorder(borderRadius: borderRadius);
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return SizedBox(
      width: _loadingSize,
      height: _loadingSize,
      child: CircularProgressIndicator(
        strokeWidth: _loadingStroke,
        valueColor: AlwaysStoppedAnimation<Color>(
          _resolveForegroundColor(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final foregroundColor = _resolveForegroundColor(context);
    final textStyle = AppText.theme.bodyLarge?.copyWith(
      color: foregroundColor,
      fontWeight: FontWeight.w600,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) ...[
          leadingIcon!,
          const Gap(_iconSpacing),
        ],
        Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        if (trailingIcon != null) ...[
          const Gap(_iconSpacing),
          trailingIcon!,
        ],
      ],
    );
  }
}
