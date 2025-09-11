// ignore_for_file: prefer_const_constructors

import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../post/pump_post.dart';

void main() {
  group(PostSearchPage, () {
    Widget buildSubject() => PostSearchPage();

    testWidgets('renders $PostSearchView', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostSearchView), findsOneWidget);
    });
  });
}
