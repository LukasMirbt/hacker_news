// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(HeaderRow, () {
    Widget buildSubject({AppOtherUserCommentData? data}) {
      return Provider.value(
        value: data ?? AppOtherUserCommentDataPlaceholder(),
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
          data: AppOtherUserCommentDataPlaceholder(
            onHeaderPressed: onHeaderPressed,
          ),
        ),
      );
      await tester.tap(
        find.byType(InkWell).first,
      );
      expect(count, 1);
    });

    testWidgets('renders $VoteButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(VoteButton), findsOneWidget);
    });

    testWidgets('renders $UserAndAge', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserAndAge), findsOneWidget);
    });

    testWidgets('renders $MoreButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(MoreButton), findsOneWidget);
    });
  });
}
