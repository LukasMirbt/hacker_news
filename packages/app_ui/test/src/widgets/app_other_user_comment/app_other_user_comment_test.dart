import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group(AppOtherUserComment, () {
    Widget buildSubject({bool? isExpanded}) {
      return AppOtherUserComment(
        data: AppOtherUserCommentDataPlaceholder(
          isExpanded: isExpanded ?? false,
        ),
      );
    }

    testWidgets('renders $ExpandedBody '
        'when isExpanded', (tester) async {
      await tester.pumpApp(
        buildSubject(isExpanded: true),
      );
      expect(find.byType(ExpandedBody), findsOneWidget);
    });

    testWidgets('renders $CollapsedBody '
        'when !isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CollapsedBody), findsOneWidget);
    });
  });
}
