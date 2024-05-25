import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app.dart';
import 'package:mobile/main.dart';

const appTitle = 'COOKING COMPANION';
void main() {
  testWidgets('App can be built to show the app title',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CookingCompanionApp());
    expect(find.text(appTitle), findsOneWidget);
  });
}
