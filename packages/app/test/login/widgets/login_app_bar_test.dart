// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(LoginAppBar, () {
    Widget buildSubject() => LoginAppBar();

    AppBar findWidget(WidgetTester tester) {
      return tester.widget<AppBar>(
        find.byType(AppBar),
      );
    }

    group(AppBar, () {
      testWidgets('centerTitle is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.centerTitle, true);
      });

      testWidgets('has correct shape', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.shape, Border());
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'data',
            l10n.login_title,
          ),
        );
      });
    });
  });
}
