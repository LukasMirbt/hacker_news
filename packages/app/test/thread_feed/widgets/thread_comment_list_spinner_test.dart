// ignore_for_file: prefer_const_constructors

import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(ThreadCommentListSpinner, () {
    Widget buildSubject() => ThreadCommentListSpinner();

    testWidgets('renders $PaginationSpinner', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PaginationSpinner), findsOneWidget);
    });
  });
}
