// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply_form.dart';

import '../../post/pump_post.dart';

void main() {
  group(ReplyFormPage, () {
    ReplyFormPage createSubject() {
      return ReplyFormPage(commentId: 'commentId');
    }

    testWidgets('renders $ReplyFormView', (tester) async {
      await tester.pumpPost(createSubject());
      expect(find.byType(ReplyFormView), findsOneWidget);
    });
  });
}
