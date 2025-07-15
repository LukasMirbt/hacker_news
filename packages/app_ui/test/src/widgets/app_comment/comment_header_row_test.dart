// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(CommentHeaderRow, () {
    Widget buildSubject({AppCommentData? data}) {
      return Provider.value(
        value: data ?? AppCommentDataPlaceholder(),
        child: CommentHeaderRow(),
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
          data: AppCommentDataPlaceholder(
            onHeaderPressed: onHeaderPressed,
          ),
        ),
      );
      await tester.tap(
        find.byType(InkWell).first,
      );
      expect(count, 1);
    });

    testWidgets('renders $CommentVoteButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentVoteButton), findsOneWidget);
    });

    testWidgets('renders $CommentUserAndAge', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentUserAndAge), findsOneWidget);
    });

    testWidgets('renders $CommentMoreButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentMoreButton), findsOneWidget);
    });
  });
}
