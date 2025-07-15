// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(PostHeaderContentRow, () {
    Widget buildSubject({AppPostHeaderData? data}) {
      return Provider.value(
        value: data ?? AppPostHeaderDataPlaceholder(),
        child: PostHeaderContentRow(),
      );
    }

    testWidgets('calls onPressed when $InkWell is tapped', (tester) async {
      var count = 0;

      void onPressed() {
        count += 1;
      }

      await tester.pumpApp(
        buildSubject(
          data: AppPostHeaderDataPlaceholder(
            onPressed: onPressed,
          ),
        ),
      );
      await tester.tap(find.byType(InkWell));
      expect(count, 1);
    });

    testWidgets('renders $PostHeaderTitle', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderTitle), findsOneWidget);
    });

    testWidgets('renders $PostHeaderSubtitle', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderSubtitle), findsOneWidget);
    });
  });
}
