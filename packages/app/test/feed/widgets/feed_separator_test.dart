// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() {
  group(FeedSeparator, () {
    Widget buildSubject() => FeedSeparator();

    testWidgets('renders $Divider', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<Divider>(
        find.byType(Divider),
      );
      expect(widget.height, 0);
    });
  });
}
