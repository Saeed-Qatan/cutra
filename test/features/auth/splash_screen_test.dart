import 'package:cutra/main.dart';
import 'package:cutra/features/auth/splash/view_models/splash_view_model.dart';
import 'package:cutra/features/auth/splash/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  testWidgets('Splash leaves navigation to the auth router', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: SplashScreen())),
    );
    await tester.pump();
    await tester.runAsync(() async {
      await precachePictureForTest();
    });
    await tester.pump();
    expect(find.byType(SvgPicture), findsOneWidget);

    expect(find.text('VER. 1.0'), findsOneWidget);
    expect(find.text('ENG-TOOL'), findsOneWidget);
    expect(find.text('Cutra'), findsOneWidget);
    expect(find.text('دقة في كل قطعة'), findsOneWidget);
    expect(find.text('أداة هندسية لتقطيع الزجاج'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('Splash stays visible for five seconds then navigates to Login', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const MyApp()),
    );
    await tester.pump();
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(tester.getRect(find.text('VER. 1.0')).top, greaterThanOrEqualTo(48));
    expect(
      tester.getRect(find.text('أداة هندسية لتقطيع الزجاج')).bottom,
      lessThan(844),
    );
    await tester.pump(const Duration(milliseconds: 4999));
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(container.read(splashViewModelProvider), isFalse);
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pumpAndSettle();
    expect(find.byType(SplashScreen), findsNothing);
    expect(find.text('مرحبًا بعودتك'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

Future<void> precachePictureForTest() async {
  final picture = await vg.loadPicture(
    const SvgAssetLoader('assets/icons/cutra_icon.svg'),
    null,
  );
  expect(picture.size, const Size(512, 512));
  picture.picture.dispose();
}
