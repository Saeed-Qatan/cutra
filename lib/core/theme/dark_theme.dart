import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'app_theme.dart';

final darkTheme = buildAppTheme(
  colors:
      ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: const Color(0xFFAFC6FF),
        onPrimary: const Color(0xFF001944),
        secondary: const Color(0xFFC8C6C5),
        surface: const Color(0xFF1B1C1C),
        onSurface: const Color(0xFFF2F0F0),
        error: const Color(0xFFFFB4AB),
        outline: const Color(0xFF737784),
      ),
  background: const Color(0xFF1B1C1C),
  buttonBackground: const Color(0xFFAFC6FF),
  buttonForeground: const Color(0xFF001944),
);
