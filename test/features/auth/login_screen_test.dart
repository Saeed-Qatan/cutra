import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cutra/core/errors/failures.dart';
import 'package:cutra/core/widgets/common/custom_button.dart';
import 'package:cutra/core/widgets/common/custom_text_field.dart';
import 'package:cutra/features/auth/models/auth_models.dart';
import 'package:cutra/features/auth/view_models/auth_view_model.dart';
import 'package:cutra/features/auth/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

class _LoginViewModel extends LoginViewModel {
  final completion = Completer<void>();
  String? email;
  String? password;

  @override
  LoginState build() => const LoginState();

  @override
  Future<void> submit(LoginModel credentials) async {
    email = credentials.email.trim();
    password = credentials.password;
    state = const LoginState(isSubmitting: true);
    await completion.future;
    state = const LoginState(failure: AuthFailure('بيانات الدخول غير صحيحة'));
  }
}

class _SignedInViewModel extends LoginViewModel {
  @override
  LoginState build() => const LoginState(isSuccess: true);

  @override
  void reset() {
    state = const LoginState(isSuccess: false);
  }
}

void main() {
  late _LoginViewModel viewModel;
  final previewKey = GlobalKey();

  Future<void> mount(
    WidgetTester tester, {
    Size size = const Size(390, 844),
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    if (const bool.fromEnvironment('CAPTURE_LOGIN')) {
      await tester.runAsync(() async {
        for (final font in <String, String>{
          'IBMPlexSansArabic': 'assets/fonts/IBMPlexSansArabic-Regular.ttf',
          'IBMPlexSans': 'assets/fonts/IBMPlexSans-Regular.ttf',
          'monospace': 'assets/fonts/IBMPlexSans-Regular.ttf',
          'Manrope': 'assets/fonts/Manrope-Variable.ttf',
          'MaterialIcons': 'fonts/MaterialIcons-Regular.otf',
        }.entries) {
          final loader = FontLoader(font.key)
            ..addFont(rootBundle.load(font.value));
          await loader.load();
        }
      });
    }
    viewModel = _LoginViewModel();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginViewModelProvider.overrideWith(() => viewModel),
        ],
        child: RepaintBoundary(
          key: previewKey,
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        ),
      ),
    );
    await tester.runAsync(() async {
      final picture = await vg.loadPicture(
        const SvgAssetLoader('assets/icons/cutra_icon.svg'),
        null,
      );
      picture.picture.dispose();
    });
    await tester.pumpAndSettle();
  }

  testWidgets(
    'Shows the reference content with shared controls and local SVG',
    (tester) async {
      await mount(tester);
      expect(find.text('AUTH-PORTAL'), findsOneWidget);
      expect(find.text('مرحبًا بعودتك'), findsOneWidget);
      expect(find.text('البريد الإلكتروني'), findsOneWidget);
      expect(find.text('كلمة المرور'), findsOneWidget);
      expect(find.text('إنشاء حساب'), findsNothing);
      expect(find.byType(CustomTextField), findsNWidgets(2));
      expect(find.byType(CustomButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(tester.getSize(find.byType(SvgPicture)), const Size(56, 56));
      expect(
        tester.getRect(find.text('PRECISION ENGINE  ·  SAAS')).bottom,
        lessThan(844),
      );
      expect(tester.takeException(), isNull);

      if (const bool.fromEnvironment('CAPTURE_LOGIN')) {
        await tester.runAsync(() async {
          final boundary =
              previewKey.currentContext!.findRenderObject()!
                  as RenderRepaintBoundary;
          final image = await boundary.toImage(pixelRatio: 2);
          final raw = await image.toByteData(
            format: ui.ImageByteFormat.rawRgba,
          );
          final logoRect = tester.getRect(find.byType(SvgPicture));
          final x = ((logoRect.left + 4) * 2).round();
          final y = (logoRect.center.dy * 2).round();
          final offset = (y * image.width + x) * 4;
          expect(raw!.getUint8(offset), lessThan(40));
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          await File(
            'build/login_preview.png',
          ).writeAsBytes(bytes!.buffer.asUint8List());
          image.dispose();
        });
      }
    },
  );

  testWidgets('Validates input and toggles password visibility', (
    tester,
  ) async {
    await mount(tester);
    await tester.tap(find.byType(CustomButton));
    await tester.pumpAndSettle();
    expect(find.text('أدخل البريد الإلكتروني'), findsWidgets);
    expect(viewModel.email, isNull);
    await tester.enterText(find.byType(TextFormField).first, 'invalid');
    await tester.enterText(find.byType(TextFormField).last, 'secret');
    await tester.tap(find.byTooltip('إظهار كلمة المرور'));
    await tester.pump();
    expect(
      tester.widget<TextField>(find.byType(TextField).last).obscureText,
      isFalse,
    );
    await tester.tap(find.byType(CustomButton));
    await tester.pumpAndSettle();
    expect(find.text('أدخل بريدًا إلكترونيًا صالحًا'), findsOneWidget);
    expect(viewModel.email, isNull);
  });

  testWidgets('Shows loading and login failures without losing input', (
    tester,
  ) async {
    await mount(tester);
    await tester.enterText(
      find.byType(TextFormField).first,
      ' user@example.com ',
    );
    await tester.enterText(find.byType(TextFormField).last, 'secret');
    await tester.tap(find.byType(CustomButton));
    await tester.pump();
    expect(viewModel.email, 'user@example.com');
    expect(viewModel.password, 'secret');
    expect(
      tester.widget<CustomButton>(find.byType(CustomButton)).isLoading,
      isTrue,
    );
    expect(
      tester.widget<TextFormField>(find.byType(TextFormField).first).enabled,
      isFalse,
    );
    viewModel.completion.complete();
    await tester.pumpAndSettle();
    expect(find.text('بيانات الدخول غير صحيحة'), findsOneWidget);
    expect(
      tester
          .widget<TextFormField>(find.byType(TextFormField).first)
          .controller!
          .text,
      ' user@example.com ',
    );
  });

  testWidgets('Small view and keyboard remain scrollable without overflow', (
    tester,
  ) async {
    await mount(tester, size: const Size(320, 640));
    tester.view.viewInsets = const FakeViewPadding(bottom: 280);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(CustomButton));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('Signed-in state stays on Login and can sign out', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [loginViewModelProvider.overrideWith(_SignedInViewModel.new)],
        child: const MaterialApp(home: LoginScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('تم تسجيل الدخول'), findsOneWidget);
    expect(find.byType(CustomButton), findsNothing);
    await tester.tap(find.text('تسجيل الخروج'));
    await tester.pumpAndSettle();
    expect(find.byType(CustomButton), findsOneWidget);
  });
}
