// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/drafts/drafts.dart';

import '../pump_drafts.dart';

void main() {
  group(DraftPage, () {
    Widget buildSubject() => DraftPage();

    testWidgets('renders $DraftView', (tester) async {
      await tester.pumpDrafts(buildSubject());
      expect(find.byType(DraftView), findsOneWidget);
    });
  });
}
