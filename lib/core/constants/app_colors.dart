import 'package:flutter/material.dart';

/// Centralized application color palette definitions.
abstract class AppColors {
  /// Primary theme color
  static const Color primary = Colors.deepPurple;

  /// Secondary theme color
  static const Color secondary = Colors.amber;

  /// Background color for dark theme
  static const Color background = Color(0xFF121212);

  /// Card surface color
  static const Color surface = Color(0xFF1E1E1E);

  /// Text primary color
  static const Color textPrimary = Colors.white;

  /// Text secondary color
  static const Color textSecondary = Colors.white70;

  /// Error color
  static const Color error = Colors.redAccent;
}
