// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppCommentData extends Mock implements AppCommentData {}

void main() {
  const user = 'user';
  const age = 'age';

  group(CommentUserAndAge, () {
    late AppCommentData data;

    setUp(() {
      data = _MockAppCommentData();
      when(() => data.user).thenReturn(user);
      when(() => data.age).thenReturn(age);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: CommentUserAndAge(),
      );
    }

    testWidgets('renders user', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(user), findsOneWidget);
    });

    testWidgets('renders age', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(age), findsOneWidget);
    });
  });
}
