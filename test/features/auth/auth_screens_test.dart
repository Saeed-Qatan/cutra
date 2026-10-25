import 'package:cutra/app/router/app_routes.dart';
import 'package:cutra/features/auth/presentation/views/screens/login_screen.dart';
import 'package:cutra/features/auth/presentation/views/screens/password_recovery_screen.dart';
import 'package:cutra/features/auth/presentation/views/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('login shows local success feedback', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: LoginScreen())),
    );

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'user@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'secret');
    await tester.ensureVisible(find.text('التحقق من بيانات الدخول'));
    await tester.tap(find.text('التحقق من بيانات الدخول'));
    await tester.pump();
    await tester.pump();

    expect(
      find.descendant(
        of: find.byType(SnackBar),
        matching: find.text('اكتمل التحقق من البيانات محليًا'),
      ),
      findsOneWidget,
    );
    expect(find.text('لم يتم تسجيل الدخول إلى الخادم بعد'), findsOneWidget);
  });

  testWidgets('register shows invalid-form feedback', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: RegisterScreen())),
    );

    await tester.ensureVisible(find.text('التحقق من بيانات الورشة'));
    await tester.tap(find.text('التحقق من بيانات الورشة'));
    await tester.pump();

    expect(find.text('يرجى تصحيح بيانات التسجيل'), findsOneWidget);
  });

  testWidgets('register back arrow returns to login', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.register,
      routes: [
        GoRoute(
          path: AppRoutes.register,
          builder: (_, _) => const RegisterScreen(),
        ),
        GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(child: MaterialApp.router(routerConfig: router)),
    );
    await tester.tap(find.byTooltip('العودة إلى تسجيل الدخول'));
    await tester.pumpAndSettle();

    expect(find.text('مرحبًا بعودتك'), findsOneWidget);
  });

  testWidgets('register keeps entered data after editing local success', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: RegisterScreen())),
    );
    const values = [
      'ورشة النور',
      '777123456',
      'owner@example.com',
      'صنعاء',
      'secret123',
      'secret123',
    ];
    for (var index = 0; index < values.length; index++) {
      await tester.enterText(
        find.byType(TextFormField).at(index),
        values[index],
      );
    }
    await tester.ensureVisible(find.text('التحقق من بيانات الورشة'));
    await tester.tap(find.text('التحقق من بيانات الورشة'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('تعديل البيانات'));
    await tester.pumpAndSettle();

    for (var index = 0; index < values.length; index++) {
      final field = tester.widget<TextFormField>(
        find.byType(TextFormField).at(index),
      );
      expect(field.controller?.text, values[index]);
    }
  });

  for (final textScale in [1.0, 2.0]) {
    testWidgets('register stacks password fields at 320px, scale $textScale', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(320, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: MediaQuery(
              data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
              child: const RegisterScreen(),
            ),
          ),
        ),
      );
      final password = tester.getRect(find.text('كلمة المرور'));
      final confirmation = tester.getRect(find.text('تأكيد كلمة المرور'));
      expect(confirmation.top, greaterThan(password.bottom));
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('recovery succeeds locally without claiming email delivery', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: PasswordRecoveryScreen())),
    );

    await tester.enterText(find.byType(TextFormField), 'owner@example.com');
    await tester.tap(find.text('التحقق من البريد'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 900));
    await tester.pump();

    expect(
      find.text('صيغة البريد صحيحة. لم يُرسل رابط استعادة بعد.'),
      findsOneWidget,
    );
    expect(find.text('تعديل البريد'), findsOneWidget);
  });

  for (final width in [320.0, 390.0]) {
    testWidgets('recovery fits ${width.toInt()}px and validates email', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: PasswordRecoveryScreen())),
      );
      expect(find.text('نسيت كلمة المرور؟'), findsOneWidget);
      expect(find.text('البريد الإلكتروني للورشة'), findsWidgets);
      final backButton = tester.getRect(find.byTooltip('العودة لتسجيل الدخول'));
      final pageTitle = tester.getRect(find.text('استعادة كلمة المرور'));
      final formTitle = tester.getRect(find.text('نسيت كلمة المرور؟'));
      final footer = tester.getRect(find.text('العودة لتسجيل الدخول'));
      expect(backButton.top, lessThan(80));
      expect(backButton.right, greaterThan(width / 2));
      expect(pageTitle.center.dx, closeTo(width / 2, 2));
      expect(formTitle.top, greaterThan(180));
      expect(footer.bottom, greaterThan(700));
      expect(tester.takeException(), isNull);

      await tester.tap(find.text('التحقق من البريد'));
      await tester.pump();
      expect(find.text('أدخل البريد الإلكتروني'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('recovery remains scrollable with keyboard and large text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 560);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(
              viewInsets: EdgeInsets.only(bottom: 260),
              textScaler: TextScaler.linear(2),
            ),
            child: PasswordRecoveryScreen(),
          ),
        ),
      ),
    );
    await tester.ensureVisible(find.text('التحقق من البريد'));
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
