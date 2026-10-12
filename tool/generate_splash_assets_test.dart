import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'Export the SVG logo for native splash and launcher resources',
    () async {
      final source = await vg.loadPicture(
        SvgStringLoader(
          await File('assets/icons/cutra_icon.svg').readAsString(),
        ),
        null,
      );
      try {
        await _export(
          source.picture,
          1024,
          1024,
          'assets/icons/cutra_launcher.png',
          background: const ui.Color(0xFF111111),
        );
        await _export(
          source.picture,
          384,
          384,
          'assets/icons/cutra_splash.png',
        );
        await _export(
          source.picture,
          1152,
          512,
          'assets/icons/cutra_splash_android12.png',
        );
      } finally {
        source.picture.dispose();
      }
    },
  );
}

Future<void> _export(
  ui.Picture source,
  int canvasSize,
  int logoSize,
  String path, {
  ui.Color? background,
}) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  if (background != null) {
    canvas.drawColor(background, ui.BlendMode.src);
  }
  final padding = (canvasSize - logoSize) / 2;
  canvas.translate(padding, padding);
  canvas.scale(logoSize / 512);
  canvas.drawPicture(source);
  final picture = recorder.endRecording();
  final image = await picture.toImage(canvasSize, canvasSize);
  try {
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    expect(png, isNotNull);
    await File(path).writeAsBytes(
      png!.buffer.asUint8List(png.offsetInBytes, png.lengthInBytes),
    );
  } finally {
    image.dispose();
    picture.dispose();
  }
}
