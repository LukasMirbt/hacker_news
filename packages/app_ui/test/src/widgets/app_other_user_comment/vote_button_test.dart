// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppOtherUserCommentData extends Mock
    implements AppOtherUserCommentData {}

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  const grade = 100.0;
  const color = Colors.red;

  group(VoteButton, () {
    late AppOtherUserCommentData data;

    setUp(() {
      data = _MockAppOtherUserCommentData();
      registerFallbackValue(_MockColorScheme());
      when(() => data.onVotePressed).thenReturn(() {});
      when(() => data.voteIconGrade).thenReturn(grade);
      when(() => data.voteIconColor(any())).thenReturn(color);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: VoteButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onVotePressed when $IconButton '
        'is pressed', (tester) async {
      var count = 0;

      void onVotePressed() {
        count += 1;
      }

      when(() => data.onVotePressed).thenReturn(onVotePressed);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      expect(count, 1);
    });

    testWidgets('has correct icon grade', (tester) async {
      await tester.pumpApp(buildSubject());
      final icon = tester.widget<AppIcon>(
        find.byType(AppIcon),
      );
      expect(icon.grade, grade);
    });

    testWidgets('has correct icon color', (tester) async {
      await tester.pumpApp(buildSubject());
      final icon = tester.widget<AppIcon>(
        find.byType(AppIcon),
      );
      expect(icon.color, color);
    });
  });
}
