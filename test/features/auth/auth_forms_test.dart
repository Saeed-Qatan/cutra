import 'package:cutra/features/auth/presentation/views/widgets/login/login_form.dart';
import 'package:cutra/features/auth/presentation/views/widgets/recovery/recovery_email_form.dart';
import 'package:cutra/features/auth/presentation/views/widgets/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('login form reports invalid input without submitting', (
    tester,
  ) async {
    var submissions = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(
            isSubmitting: false,
            onSubmit: (_) async => submissions++,
            onForgotPassword: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.text('التحقق من بيانات الدخول'));
    await tester.pump();
    expect(submissions, 0);
    expect(find.text('يرجى تصحيح بيانات الدخول'), findsOneWidget);
  });

  testWidgets('register form reports invalid input without submitting', (
    tester,
  ) async {
    var submissions = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: RegisterForm(
              isSubmitting: false,
              onSubmit: (_) async => submissions++,
            ),
          ),
        ),
      ),
    );

    await tester.ensureVisible(find.text('التحقق من بيانات الورشة'));
    await tester.tap(find.text('التحقق من بيانات الورشة'));
    await tester.pump();
    expect(submissions, 0);
    expect(find.text('يرجى تصحيح بيانات التسجيل'), findsOneWidget);
  });

  testWidgets('recovery form describes local validation, not email delivery', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecoveryEmailForm(
            isSubmitting: false,
            isSuccess: true,
            onSubmit: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('تعديل البريد'), findsOneWidget);
    expect(
      find.text('صيغة البريد صحيحة. لم يُرسل رابط استعادة بعد.'),
      findsOneWidget,
    );
  });
}
