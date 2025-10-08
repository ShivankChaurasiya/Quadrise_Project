import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first_prjt_quadrise/main.dart';

void main() {
  testWidgets('Login page displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the login page shows "Sign In"
    expect(find.text('Sign In'), findsWidgets);
  });
}
