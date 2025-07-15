// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppPostHeaderData extends Mock implements AppPostHeaderData {}

void main() {
  group(PostHeaderShareButton, () {
    late AppPostHeaderData data;

    setUp(() {
      data = _MockAppPostHeaderData();
      when(() => data.onSharePressed).thenReturn(() {});
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: PostHeaderShareButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onSharePressed when $IconButton '
        'is pressed', (tester) async {
      var count = 0;

      void onSharePressed() {
        count += 1;
      }

      when(() => data.onSharePressed).thenReturn(onSharePressed);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      expect(count, 1);
    });
  });
}
