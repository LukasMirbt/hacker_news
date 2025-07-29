// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/app_current_user_comment/app_current_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

void main() {
  group(CollapsedBody, () {
    Widget buildSubject() {
      return Provider<AppCurrentUserCommentData>.value(
        value: AppCurrentUserCommentDataPlaceholder(),
        child: CollapsedBody(),
      );
    }

    testWidgets('renders $HeaderRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(HeaderRow), findsOneWidget);
    });
  });
}
