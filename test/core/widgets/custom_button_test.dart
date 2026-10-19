import 'package:cutra/core/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomButton Tests', () {
    testWidgets('renders text and handles tap', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'تسجيل الدخول',
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      expect(find.text('تسجيل الدخول'), findsOneWidget);
      await tester.tap(find.byType(CustomButton));
      expect(pressed, isTrue);
    });

    testWidgets('displays loading indicator and does not trigger tap',
        (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'تسجيل الدخول',
              isLoading: true,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('تسجيل الدخول'), findsNothing);

      await tester.tap(find.byType(CustomButton));
      expect(pressed, isFalse);
    });

    testWidgets('renders leading and trailing icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'متابعة',
              onPressed: () {},
              leadingIcon: const Icon(Icons.check, key: Key('leading')),
              trailingIcon: const Icon(Icons.arrow_forward, key: Key('trailing')),
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('leading')), findsOneWidget);
      expect(find.text('متابعة'), findsOneWidget);
      expect(find.byKey(const Key('trailing')), findsOneWidget);
    });

    testWidgets('supports outline variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'إلغاء',
              variant: ButtonVariant.outline,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('إلغاء'), findsOneWidget);
    });
  });
}
