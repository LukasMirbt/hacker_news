// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

void main() {
  group(ExpandedBody, () {
    Widget buildSubject() {
      return Provider<AppOtherUserCommentData>.value(
        value: AppOtherUserCommentDataPlaceholder(),
        child: ExpandedBody(),
      );
    }

    testWidgets('renders $HeaderRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(HeaderRow), findsOneWidget);
    });

    testWidgets('renders $Html', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Html), findsOneWidget);
    });
  });
}
