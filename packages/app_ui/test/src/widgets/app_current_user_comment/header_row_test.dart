// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/app_current_user_comment/app_current_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(HeaderRow, () {
    Widget buildSubject({AppCurrentUserCommentData? data}) {
      return Provider.value(
        value: data ?? AppCurrentUserCommentDataPlaceholder(),
        child: HeaderRow(),
      );
    }

    testWidgets('calls onHeaderPressed when $InkWell '
        'is tapped', (tester) async {
      var count = 0;

      void onHeaderPressed() {
        count += 1;
      }

      await tester.pumpApp(
        buildSubject(
          data: AppCurrentUserCommentDataPlaceholder(
            onHeaderPressed: onHeaderPressed,
          ),
        ),
      );
      await tester.tap(
        find.byType(InkWell).first,
      );
      expect(count, 1);
    });

    testWidgets('renders $HeaderText', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(HeaderText), findsOneWidget);
    });

    testWidgets('renders $MoreButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(MoreButton), findsOneWidget);
    });
  });
}
