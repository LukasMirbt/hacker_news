// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';

import '../../post/pump_post.dart';

void main() {
  group(CommentPage, () {
    CommentPage createSubject() => CommentPage();

    testWidgets('renders $CommentView', (tester) async {
      await tester.pumpPost(createSubject());
      expect(find.byType(CommentView), findsOneWidget);
    });
  });
}
