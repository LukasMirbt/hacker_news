// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post/post.dart';

import '../pump_post.dart';

void main() {
  group(PostPage, () {
    Widget buildSubject() => PostPage(id: 'id');

    testWidgets('renders $PostView', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostView), findsOneWidget);
    });
  });
}
