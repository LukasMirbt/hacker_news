// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_options/post_options.dart';

import '../../post/pump_post.dart';

void main() {
  group(PostOptionsSheet, () {
    Widget buildSubject() => PostOptionsSheet();

    testWidgets('renders $PostOptionsView', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostOptionsView), findsOneWidget);
    });
  });
}
