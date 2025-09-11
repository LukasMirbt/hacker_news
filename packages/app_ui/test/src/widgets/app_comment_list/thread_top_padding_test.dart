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

  group(ThreadTopPadding, () {
    late AppCommentListData data;

    setUp(() {
      data = _MockAppCommentListData();
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Provider.value(
          value: index,
          child: ThreadTopPadding(),
        ),
      );
    }

    testWidgets('renders $ThreadTopPaddingBody '
        'when isStartOfThread', (tester) async {
      when(() => data.isStartOfThread(index)).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadTopPaddingBody), findsOneWidget);
    });

    testWidgets('does not render $ThreadTopPaddingBody '
        'when !isStartOfThread', (tester) async {
      when(() => data.isStartOfThread(index)).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadTopPaddingBody), findsNothing);
    });
  });

  group(ThreadTopPaddingBody, () {
    Widget buildSubject() => ThreadTopPaddingBody();

    testWidgets('renders $SizedBox with correct width '
        'and height', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is SizedBox &&
              widget.width == double.infinity &&
              widget.height == AppSpacing.xs,
        ),
        findsOneWidget,
      );
    });
  });
}
