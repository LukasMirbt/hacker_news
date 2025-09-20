// ignore_for_file: prefer_const_constructors

import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(ThreadPlaceholderComment, () {
    Widget buildSubject() => ThreadPlaceholderComment(1);

    testWidgets('renders $OtherUserThreadComment', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<OtherUserThreadComment>(
        find.byType(OtherUserThreadComment),
      );
      expect(
        widget.item,
        isA<OtherUserThreadCommentModelPlaceholder>(),
      );
    });
  });
}
