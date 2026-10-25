import 'package:flutter/material.dart';

/// Shared corner marks used across Auth screens (Splash, Login, etc.).
class TechnicalCornerMarks extends StatelessWidget {
  const TechnicalCornerMarks({super.key});

  @override
  Widget build(BuildContext context) {
    const size = 12.0;
    const padding = 24.0;
    const color = Color(0x33111111);

    return Positioned.fill(
      child: IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            children: const [
              Positioned(
                top: 0,
                right: 0,
                child: _CornerMark(
                  size: size,
                  color: color,
                  top: true,
                  right: true,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: _CornerMark(
                  size: size,
                  color: color,
                  top: true,
                  left: true,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: _CornerMark(
                  size: size,
                  color: color,
                  bottom: true,
                  right: true,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: _CornerMark(
                  size: size,
                  color: color,
                  bottom: true,
                  left: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CornerMark extends StatelessWidget {
  final double size;
  final Color color;
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;

  const _CornerMark({
    required this.size,
    required this.color,
    this.top = false,
    this.bottom = false,
    this.left = false,
    this.right = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border(
          top: top ? BorderSide(color: color, width: 1.0) : BorderSide.none,
          bottom: bottom
              ? BorderSide(color: color, width: 1.0)
              : BorderSide.none,
          left: left ? BorderSide(color: color, width: 1.0) : BorderSide.none,
          right: right ? BorderSide(color: color, width: 1.0) : BorderSide.none,
        ),
      ),
    );
  }
}
