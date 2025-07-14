import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(AppPostHeaderCommentButton, () {
    Widget buildSubject({
      AppPostHeaderCommentButtonData? data,
    }) {
      return AppPostHeaderCommentButton(
        data: data ?? AppPostHeaderCommentButtonDataPlaceholder(),
      );
    }

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('calls onPressed when $TextButton '
        'is pressed', (tester) async {
      var count = 0;

      void onPressed() {
        count += 1;
      }

      await tester.pumpApp(
        buildSubject(
          data: AppPostHeaderCommentButtonDataPlaceholder(
            onPressed: onPressed,
          ),
        ),
      );
      await tester.tap(find.byType(TextButton));
      expect(count, 1);
    });

    testWidgets('renders commentCount', (tester) async {
      const commentCount = 'commentCount';
      await tester.pumpApp(
        buildSubject(
          data: AppPostHeaderCommentButtonDataPlaceholder(
            commentCount: commentCount,
          ),
        ),
      );
      expect(find.text(commentCount), findsOneWidget);
    });
  });
}
