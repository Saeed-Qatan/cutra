import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'app_theme.dart';

final lightTheme = buildAppTheme(
  colors: ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    error: AppColors.error,
    outline: AppColors.outline,
  ),
  background: AppColors.surface,
  buttonBackground: AppColors.ink,
  buttonForeground: AppColors.white,
);
