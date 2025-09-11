// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppCommentListData extends Mock implements AppCommentListData {}

void main() {
  const index = 1;

  group(CommentListFooter, () {
    late AppCommentListData data;

    setUp(() {
      data = _MockAppCommentListData();
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Provider.value(
          value: index,
          child: CommentListFooter(),
        ),
      );
    }

    testWidgets('renders $CommentListFooterBody '
        'when isEndOfList', (tester) async {
      when(() => data.isEndOfList(index)).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListFooterBody), findsOneWidget);
    });

    testWidgets('does not render $CommentListFooterBody '
        'when !isEndOfList', (tester) async {
      when(() => data.isEndOfList(index)).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListFooterBody), findsNothing);
    });
  });

  group(CommentListFooterBody, () {
    Widget buildSubject() => CommentListFooterBody();

    testWidgets('renders $SizedBox with correct height', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.height == AppSpacing.lg,
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders $SafeArea', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SafeArea), findsOneWidget);
    });
  });
}
