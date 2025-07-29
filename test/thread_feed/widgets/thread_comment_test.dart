// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:thread_repository/thread_repository.dart'
    hide CurrentUserThreadComment, OtherUserThreadComment, ThreadComment;

import '../../app/pump_app.dart';

void main() {
  group(ThreadComment, () {
    Widget buildSubject(ThreadCommentModel item) => ThreadComment(item);

    testWidgets('renders $CurrentUserThreadComment when item '
        'is $CurrentUserThreadCommentModel', (tester) async {
      await tester.pumpApp(
        buildSubject(
          OtherUserThreadCommentModel(
            comment: OtherUserThreadCommentPlaceholder(),
          ),
        ),
      );
      expect(find.byType(CurrentUserThreadComment), findsNothing);
    });

    testWidgets('renders $OtherUserThreadComment when item '
        'is $OtherUserThreadCommentModel', (tester) async {
      await tester.pumpApp(
        buildSubject(
          OtherUserThreadCommentModel(
            comment: OtherUserThreadCommentPlaceholder(),
          ),
        ),
      );
      expect(find.byType(OtherUserThreadComment), findsOneWidget);
    });
  });
}
