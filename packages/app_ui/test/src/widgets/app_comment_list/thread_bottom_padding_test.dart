// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppCommentListData extends Mock implements AppCommentListData {}

class _MockAppCommentModel extends Mock implements AppCommentModel {}

void main() {
  const index = 1;
  const threadBottomPadding = 1.0;

  group(ThreadBottomPadding, () {
    late AppCommentListData data;
    late AppCommentModel comment;

    setUp(() {
      data = _MockAppCommentListData();
      comment = _MockAppCommentModel();
      when(() => comment.threadBottomPadding).thenReturn(
        threadBottomPadding,
      );
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Provider.value(
          value: index,
          child: Provider.value(
            value: comment,
            child: ThreadBottomPadding(),
          ),
        ),
      );
    }

    testWidgets('renders $ThreadBottomPaddingBody '
        'when isEndOfThread', (tester) async {
      when(() => data.isEndOfThread(index)).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadBottomPaddingBody), findsOneWidget);
    });

    testWidgets('does not render $ThreadBottomPaddingBody '
        'when !isEndOfThread', (tester) async {
      when(() => data.isEndOfThread(index)).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadBottomPaddingBody), findsNothing);
    });
  });

  group(ThreadBottomPaddingBody, () {
    late AppCommentModel comment;

    setUp(() {
      comment = _MockAppCommentModel();
      when(() => comment.threadBottomPadding).thenReturn(
        threadBottomPadding,
      );
    });

    Widget buildSubject() {
      return Provider.value(
        value: comment,
        child: ThreadBottomPaddingBody(),
      );
    }

    testWidgets('renders $SizedBox with correct width '
        'and height', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is SizedBox &&
              widget.width == double.infinity &&
              widget.height == threadBottomPadding,
        ),
        findsOneWidget,
      );
    });
  });
}
