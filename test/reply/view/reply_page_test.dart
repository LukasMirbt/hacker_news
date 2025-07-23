// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';

import '../../post/pump_post.dart';

void main() {
  group(ReplyPage, () {
    ReplyPage createSubject() {
      return ReplyPage(url: 'url');
    }

    testWidgets('renders $ReplyView', (tester) async {
      await tester.pumpPost(createSubject());
      expect(find.byType(ReplyView), findsOneWidget);
    });
  });
}
