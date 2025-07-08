// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_options/comment_options.dart';

import '../../post/pump_post.dart';

void main() {
  group(CommentOptionsSheet, () {
    Widget buildSubject() => CommentOptionsSheet(commentId: 'commentId');

    testWidgets('renders $CommentOptionsView', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(CommentOptionsView), findsOneWidget);
    });
  });
}
