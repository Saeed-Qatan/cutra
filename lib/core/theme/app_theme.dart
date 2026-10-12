import 'package:flutter/material.dart';

import '../constants/colors.dart';

abstract final class AppSizes {
  static const button = 48.0;
  static const field = 48.0;
  static const iconTouch = 48.0;
  static const navigation = 64.0;
  static const pagePadding = 16.0;
  static const sectionGap = 24.0;
  static const radius = 8.0;
}

abstract final class AppText {
  static TextStyle _style(double size, double line, FontWeight weight) {
    return TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontFamilyFallback: const ['IBMPlexSans'],
      fontSize: size,
      height: line / size,
      fontWeight: weight,
    );
  }

  static final theme = TextTheme(
    displayLarge: _style(28, 36, FontWeight.w700),
    displayMedium: _style(28, 36, FontWeight.w700),
    displaySmall: _style(28, 36, FontWeight.w700),
    headlineLarge: _style(28, 36, FontWeight.w700),
    headlineMedium: _style(20, 28, FontWeight.w600),
    headlineSmall: _style(20, 28, FontWeight.w600),
    titleLarge: _style(20, 28, FontWeight.w600),
    titleMedium: _style(18, 24, FontWeight.w600),
    titleSmall: _style(18, 24, FontWeight.w600),
    bodyLarge: _style(16, 24, FontWeight.w400),
    bodyMedium: _style(14, 20, FontWeight.w400),
    bodySmall: _style(12, 16, FontWeight.w400),
    labelLarge: _style(14, 20, FontWeight.w600),
    labelMedium: _style(12, 16, FontWeight.w600),
    labelSmall: _style(12, 16, FontWeight.w400),
  );

  static const metric = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    height: 24 / 18,
    fontWeight: FontWeight.w600,
    fontFeatures: [FontFeature.tabularFigures()],
  );
}

ThemeData buildAppTheme({
  required ColorScheme colors,
  required Color background,
  required Color buttonBackground,
  required Color buttonForeground,
}) {
  final borderRadius = BorderRadius.circular(AppSizes.radius);
  final shape = RoundedRectangleBorder(borderRadius: borderRadius);
  final fieldBorder = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: colors.outline),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colors,
    scaffoldBackgroundColor: background,
    textTheme: AppText.theme.apply(
      bodyColor: colors.onSurface,
      displayColor: colors.onSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      foregroundColor: colors.onSurface,
      elevation: 0,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      height: AppSizes.navigation,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackground,
        foregroundColor: buttonForeground,
        minimumSize: const Size(0, AppSizes.button),
        shape: shape,
        elevation: 0,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.reserved,
        foregroundColor: AppColors.white,
        minimumSize: const Size(0, AppSizes.button),
        shape: shape,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.onSurface,
        minimumSize: const Size(0, AppSizes.button),
        side: BorderSide(color: colors.outline),
        shape: shape,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colors.primary,
        minimumSize: const Size(0, AppSizes.button),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: colors.onSurface,
        minimumSize: const Size.square(AppSizes.iconTouch),
        shape: shape,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.surface,
      constraints: const BoxConstraints(minHeight: AppSizes.field),
      border: fieldBorder,
      enabledBorder: fieldBorder,
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: AppColors.reserved, width: 1.5),
      ),
    ),
    cardTheme: CardThemeData(
      color: colors.surface,
      elevation: 0,
      shape: shape.copyWith(side: BorderSide(color: colors.outline)),
    ),
  );
}
