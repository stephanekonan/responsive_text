import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_text/responsive_text.dart';

void main() {
  testWidgets('ResponsiveText displays text correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveText(
          'Hello World',
          fontSize: 16,
          color: Colors.blue,
        ),
      ),
    );

    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('ResponsiveText displays currency correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveText(
          '1000',
          isCurrency: true,
          currencySymbol: '€',
          fontSize: 18,
        ),
      ),
    );

    expect(find.text('1000 €'), findsOneWidget);
  });

  testWidgets('ResponsiveText truncates long text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveText(
          'This is a very long text',
          maxLength: 10,
          fontSize: 14,
        ),
      ),
    );

    expect(find.text('This is a ...'), findsOneWidget);
  });
}
