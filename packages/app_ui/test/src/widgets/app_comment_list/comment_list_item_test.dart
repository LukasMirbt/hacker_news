// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

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
  final commentWidget = Container();
  final commentBuilder = (_, _) => commentWidget;

  group(CommentListItem, () {
    late AppCommentListData data;
    late AppCommentModel comment;

    setUp(() {
      data = _MockAppCommentListData();
      comment = _MockAppCommentModel();
      when(() => data.commentBuilder).thenReturn(commentBuilder);
      when(() => data.isSelected(index)).thenReturn(false);
      when(() => data.isStartOfThread(index)).thenReturn(false);
      when(() => data.isEndOfThread(index)).thenReturn(false);
      when(() => comment.indentPadding).thenReturn(1);
      when(() => comment.isExpanded).thenReturn(false);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Provider.value(
          value: index,
          child: Provider.value(
            value: comment,
            child: CommentListItem(),
          ),
        ),
      );
    }

    testWidgets('renders $CommentIndent', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentIndent), findsOneWidget);
    });

    testWidgets('renders $CommentBackground', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentBackground), findsOneWidget);
    });

    testWidgets('renders commentBuilder', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(commentWidget), findsOneWidget);
    });

    testWidgets('renders $CommentPadding', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentPadding), findsOneWidget);
    });

    testWidgets('renders $ThreadBottomPadding', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadBottomPadding), findsOneWidget);
    });
  });
}
