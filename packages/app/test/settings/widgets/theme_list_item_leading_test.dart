// ignore_for_file: prefer_const_constructors

import 'package:app/settings/settings.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(ThemeListItemLeading, () {
    Widget buildSubject({Brightness? brightness}) {
      return Theme(
        data: ThemeData(brightness: brightness),
        child: ThemeListItemLeading(),
      );
    }

    group(AppIcon, () {
      AppIcon findWidget(WidgetTester tester) {
        return tester.widget<AppIcon>(
          find.byType(AppIcon),
        );
      }

      testWidgets('renders correct icon when brightness '
          'is ${Brightness.light}', (tester) async {
        await tester.pumpApp(
          buildSubject(
            brightness: Brightness.light,
          ),
        );
        final widget = findWidget(tester);
        expect(widget.icon, Symbols.light_mode_rounded);
      });

      testWidgets('renders correct icon when brightness '
          'is ${Brightness.dark}', (tester) async {
        await tester.pumpApp(
          buildSubject(
            brightness: Brightness.dark,
          ),
        );
        final widget = findWidget(tester);
        expect(widget.icon, Symbols.dark_mode_rounded);
      });
    });
  });
}
