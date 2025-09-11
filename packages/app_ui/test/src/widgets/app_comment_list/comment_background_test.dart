import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class _MockAppCommentListData extends Mock implements AppCommentListData {}

class _MockAppCommentModel extends Mock implements AppCommentModel {}

class _MockExtendedColorScheme extends Mock implements ExtendedColorScheme {}

void main() {
  final child = Container();
  const index = 1;
  const isSelected = true;
  const backgroundColor = Colors.red;

  group(CommentBackground, () {
    late AppCommentListData data;
    late AppCommentModel comment;

    setUp(() {
      data = _MockAppCommentListData();
      comment = _MockAppCommentModel();
      registerFallbackValue(_MockExtendedColorScheme());
      when(
        () => data.isSelected(index),
      ).thenReturn(isSelected);
      when(
        () => comment.backgroundColor(
          colorScheme: any(named: 'colorScheme'),
          isSelected: isSelected,
        ),
      ).thenReturn(backgroundColor);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Provider.value(
          value: index,
          child: Provider.value(
            value: comment,
            child: CommentBackground(
              child: child,
            ),
          ),
        ),
      );
    }

    group(Material, () {
      Material findWidget(WidgetTester tester) {
        return tester.widget<Material>(
          find.descendant(
            of: find.byType(CommentBackground),
            matching: find.byType(Material),
          ),
        );
      }

      testWidgets('has correct backgroundColor', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.color, backgroundColor);
      });

      testWidgets('has correct child', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.child, child);
      });
    });
  });
}
