import 'package:flutter/material.dart';

/// Shared engineering grid painter used across Auth screens (Splash, Login, etc.).
class GridBackgroundPainter extends CustomPainter {
  final Color color;
  const GridBackgroundPainter({this.color = const Color(0x09111111)});

  @override
  void paint(Canvas canvas, Size size) {
    const gridSize = 24.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant GridBackgroundPainter oldDelegate) =>
      oldDelegate.color != color;
}
