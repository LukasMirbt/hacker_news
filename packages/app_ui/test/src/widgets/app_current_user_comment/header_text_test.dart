// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/app_current_user_comment/app_current_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppCurrentUserCommentData extends Mock
    implements AppCurrentUserCommentData {}

void main() {
  const score = 'score';
  const user = 'user';
  const age = 'age';

  group(HeaderText, () {
    late AppCurrentUserCommentData data;

    setUp(() {
      data = _MockAppCurrentUserCommentData();
      when(() => data.score).thenReturn(score);
      when(() => data.user).thenReturn(user);
      when(() => data.age).thenReturn(age);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: HeaderText(),
      );
    }

    testWidgets('renders score', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.textRange.ofSubstring(score),
        findsOneWidget,
      );
    });

    testWidgets('renders user', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.textRange.ofSubstring(user),
        findsOneWidget,
      );
    });

    testWidgets('renders age', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.textRange.ofSubstring(age),
        findsOneWidget,
      );
    });
  });
}
