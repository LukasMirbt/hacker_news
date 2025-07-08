// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

void main() {
  group(ButtonSpinner, () {
    testWidgets('renders $CircularProgressIndicator '
        'with correct color', (tester) async {
      const color = Colors.red;
      await tester.pumpApp(
        ButtonSpinner(color),
      );
      final widget = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(widget.color, color);
    });
  });
}
