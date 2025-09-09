// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart'
    hide Comment, CurrentUserComment, OtherUserComment;

import '../../app/pump_app.dart';

void main() {
  group(_Comment, () {
    Widget buildSubject(CommentModel item) => _Comment(item);

    testWidgets('renders $CurrentUserComment when item '
        'is $CurrentUserCommentModel', (tester) async {
      await tester.pumpApp(
        buildSubject(
          CurrentUserCommentModel(
            comment: CurrentUserCommentPlaceholder(),
          ),
        ),
      );
      expect(find.byType(CurrentUserComment), findsOneWidget);
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
