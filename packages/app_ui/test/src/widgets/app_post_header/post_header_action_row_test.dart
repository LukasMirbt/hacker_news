// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

void main() {
  group(PostHeaderActionRow, () {
    Widget buildSubject() {
      return Provider<AppPostHeaderData>.value(
        value: AppPostHeaderDataPlaceholder(),
        child: PostHeaderActionRow(),
      );
    }

    testWidgets('renders $PostHeaderVoteButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderVoteButton), findsOneWidget);
    });

    testWidgets('renders $PostHeaderCommentButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderCommentButton), findsOneWidget);
    });

    testWidgets('renders $PostHeaderShareButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderShareButton), findsOneWidget);
    });

    testWidgets('renders $PostHeaderMoreButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderMoreButton), findsOneWidget);
    });
  });
}
