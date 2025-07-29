// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppOtherUserCommentData extends Mock
    implements AppOtherUserCommentData {}

void main() {
  const user = 'user';
  const age = 'age';

  group(UserAndAge, () {
    late AppOtherUserCommentData data;

    setUp(() {
      data = _MockAppOtherUserCommentData();
      when(() => data.user).thenReturn(user);
      when(() => data.age).thenReturn(age);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: UserAndAge(),
      );
    }

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
