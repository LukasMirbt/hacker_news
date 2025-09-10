// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockOtherUserCommentModel extends Mock
    implements OtherUserCommentModel {}

void main() {
  final child = Container();

  group(CommentIndent, () {
    late CommentModel comment;

    setUp(() {
      comment = _MockOtherUserCommentModel();
    });

    Widget buildSubject() {
      return Provider.value(
        value: comment,
        child: CommentIndent(
          child: child,
        ),
      );
    }

    testWidgets('renders correct padding', (tester) async {
      when(() => state.isSelected(comment)).thenReturn(true);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      final colorScheme = findColorScheme(tester);
      expect(widget.color, colorScheme.highlight);
    });

    testWidgets('renders $Material with correct color '
        'when !isSelected', (tester) async {
      when(() => state.isSelected(comment)).thenReturn(false);
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.color, null);
    });
  });
}
