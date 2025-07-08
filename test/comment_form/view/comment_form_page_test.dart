// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_form/comment_form.dart';

import '../../post/pump_post.dart';

void main() {
  group(CommentFormPage, () {
    CommentFormPage createSubject() => CommentFormPage();

    testWidgets('renders $CommentFormView', (tester) async {
      await tester.pumpPost(createSubject());
      expect(find.byType(CommentFormView), findsOneWidget);
    });
  });
}
