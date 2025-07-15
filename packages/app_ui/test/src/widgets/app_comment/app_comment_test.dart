import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group(AppComment, () {
    Widget buildSubject({bool? isExpanded}) {
      return AppComment(
        data: AppCommentDataPlaceholder(
          isExpanded: isExpanded ?? false,
        ),
      );
    }

    testWidgets('renders $ExpandedCommentBody '
        'when isExpanded', (tester) async {
      await tester.pumpApp(
        buildSubject(isExpanded: true),
      );
      expect(find.byType(ExpandedCommentBody), findsOneWidget);
    });

    testWidgets('renders $CollapsedCommentBody '
        'when !isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CollapsedCommentBody), findsOneWidget);
    });
  });
}
