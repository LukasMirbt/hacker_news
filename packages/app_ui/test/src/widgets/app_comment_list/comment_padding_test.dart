// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppCommentModel extends Mock implements AppCommentModel {}

void main() {
  group(CommentPadding, () {
    late AppCommentModel comment;

    setUp(() {
      comment = _MockAppCommentModel();
    });

    Widget buildSubject() {
      return Provider.value(
        value: comment,
        child: CommentPadding(),
      );
    }

    testWidgets('renders $CommentPaddingBody '
        'when isExpanded', (tester) async {
      when(() => comment.isExpanded).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentPaddingBody), findsOneWidget);
    });

    testWidgets('does not render $CommentPaddingBody '
        'when !isExpanded', (tester) async {
      when(() => comment.isExpanded).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentPaddingBody), findsNothing);
    });
  });

  group(CommentPaddingBody, () {
    Widget buildSubject() => CommentPaddingBody();

    testWidgets('renders $SizedBox with correct width '
        'and height', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is SizedBox &&
              widget.width == double.infinity &&
              widget.height == AppSpacing.sm,
        ),
        findsOneWidget,
      );
    });
  });
}
