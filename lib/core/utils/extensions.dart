import 'package:flutter/material.dart';

/// Extension methods for BuildContext
extension ContextExtensions on BuildContext {
  /// Theme shortcut
  ThemeData get theme => Theme.of(this);

  /// TextTheme shortcut
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Screen size shortcut
  Size get screenSize => MediaQuery.sizeOf(this);
}
