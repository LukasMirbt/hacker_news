import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

void main() {
  group(CommentListFooter, () {
    Widget buildSubject() {
      return CommentListFooter(
        OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(),
        ),
      );
    }

    testWidgets('renders $CommentTopLevelDivider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentTopLevelDivider), findsOneWidget);
    });
  });
}
