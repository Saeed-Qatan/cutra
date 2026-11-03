import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

/// Displays the three snackbar states supported by Cutra.
extension AwesomeSnackbarBuildContext on BuildContext {
  void showSuccessSnackbar(String message) {
    _showAwesomeSnackbar(
      title: 'نجاح',
      message: message,
      contentType: ContentType.success,
    );
  }

  void showErrorSnackbar(String message) {
    _showAwesomeSnackbar(
      title: 'خطأ',
      message: message,
      contentType: ContentType.failure,
    );
  }

  void showWarningSnackbar(String message) {
    _showAwesomeSnackbar(
      title: 'تحذير',
      message: message,
      contentType: ContentType.warning,
    );
  }

  void _showAwesomeSnackbar({
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    final messenger = ScaffoldMessenger.of(this);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: title,
            message: message,
            contentType: contentType,
          ),
        ),
      );
  }
}
