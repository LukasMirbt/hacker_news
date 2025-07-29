// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppOtherUserCommentData extends Mock
    implements AppOtherUserCommentData {}

void main() {
  group(MoreButton, () {
    late AppOtherUserCommentData data;

    setUp(() {
      data = _MockAppOtherUserCommentData();
      when(() => data.onMorePressed).thenReturn(() {});
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: MoreButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onMorePressed when $IconButton '
        'is pressed', (tester) async {
      var count = 0;

      void onMorePressed() {
        count += 1;
      }

      when(() => data.onMorePressed).thenReturn(onMorePressed);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      expect(count, 1);
    });
  });
}
