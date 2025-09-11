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

  group(CommentListDivider, () {
    late AppCommentListData data;

    setUp(() {
      data = _MockAppCommentListData();
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Provider.value(
          value: index,
          child: CommentListDivider(),
        ),
      );
    }

    testWidgets('renders $CommentListDividerBody '
        'when isEndOfThread', (tester) async {
      when(() => data.isEndOfThread(index)).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListDividerBody), findsOneWidget);
    });

    testWidgets('does not render $CommentListDividerBody '
        'when !isEndOfThread', (tester) async {
      when(() => data.isEndOfThread(index)).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListDividerBody), findsNothing);
    });
  });

  group(CommentListDividerBody, () {
    Widget buildSubject() => CommentListDividerBody();

    testWidgets('renders $Divider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Divider && widget.height == 1,
        ),
        findsOneWidget,
      );
    });
  });
}
