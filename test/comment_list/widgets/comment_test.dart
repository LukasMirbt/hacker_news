// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart'
    hide Comment, CurrentUserComment, OtherUserComment;

import '../../app/pump_app.dart';

void main() {
  group(Comment, () {
    Widget buildSubject(CommentModel item) => Comment(item);

    testWidgets('renders $CurrentUserComment when item '
        'is $CurrentUserCommentModel', (tester) async {
      await tester.pumpApp(
        buildSubject(
          OtherUserCommentModel(
            comment: OtherUserCommentPlaceholder(),
          ),
        ),
      );
      expect(find.byType(CurrentUserComment), findsNothing);
    });

    testWidgets('renders $OtherUserComment when item '
        'is $OtherUserCommentModel', (tester) async {
      await tester.pumpApp(
        buildSubject(
          OtherUserCommentModel(
            comment: OtherUserCommentPlaceholder(),
          ),
        ),
      );
      expect(find.byType(OtherUserComment), findsOneWidget);
    });
  });
}
