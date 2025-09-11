// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppCommentModel extends Mock implements AppCommentModel {}

void main() {
  final child = Container();
  const indentPadding = 1.0;

  group(CommentIndent, () {
    late AppCommentModel comment;

    setUp(() {
      comment = _MockAppCommentModel();
      when(() => comment.indentPadding).thenReturn(indentPadding);
    });

    Widget buildSubject() {
      return Provider.value(
        value: comment,
        child: CommentIndent(
          child: child,
        ),
      );
    }

    group(Padding, () {
      Padding findWidget(WidgetTester tester) {
        return tester.widget<Padding>(
          find.descendant(
            of: find.byType(CommentIndent),
            matching: find.byType(Padding),
          ),
        );
      }

      testWidgets('has correct padding', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.padding,
          EdgeInsets.only(left: indentPadding),
        );
      });

      testWidgets('has correct child', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.child, child);
      });
    });
  });
}
