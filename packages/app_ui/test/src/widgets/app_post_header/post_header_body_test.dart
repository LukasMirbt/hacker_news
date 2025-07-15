// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

void main() {
  group(PostHeaderBody, () {
    Widget buildSubject() {
      return Provider<AppPostHeaderData>.value(
        value: AppPostHeaderDataPlaceholder(),
        child: PostHeaderBody(),
      );
    }

    testWidgets('renders $PostHeaderContentRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderContentRow), findsOneWidget);
    });

    testWidgets('renders $PostHeaderActionRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderActionRow), findsOneWidget);
    });
  });
}
