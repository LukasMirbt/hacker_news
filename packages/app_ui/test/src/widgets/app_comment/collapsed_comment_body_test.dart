// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

void main() {
  group(CollapsedCommentBody, () {
    Widget buildSubject() {
      return Provider<AppCommentData>.value(
        value: AppCommentDataPlaceholder(),
        child: ExpandedCommentBody(),
      );
    }

    testWidgets('renders $CommentHeaderRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentHeaderRow), findsOneWidget);
    });
  });
}
