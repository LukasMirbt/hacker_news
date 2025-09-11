import 'package:app_ui/app_ui.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockComment extends Mock implements Collapsible<dynamic> {}

class _MockExtendedColorScheme extends Mock implements ExtendedColorScheme {}

void main() {
  group(AppCommentModel, () {
    late Collapsible<dynamic> comment;
    late ExtendedColorScheme colorScheme;

    setUp(() {
      comment = _MockComment();
      colorScheme = _MockExtendedColorScheme();
    });

    AppCommentModel createSubject() {
      return AppCommentModel(comment);
    }

    group('isExpanded', () {
      test('returns comment.isExpanded', () {
        const isExpanded = true;
        when(() => comment.isExpanded).thenReturn(isExpanded);
        final model = createSubject();
        expect(model.isExpanded, isExpanded);
      });
    });

    group('indentPadding', () {
      test('returns correct value', () {
        const indent = 2;
        when(() => comment.indent).thenReturn(indent);
        final model = createSubject();
        expect(model.indentPadding, indent * AppSpacing.md);
      });
    });

    group('threadBottomPadding', () {
      test('returns correct value '
          'when comment.isExpanded', () {
        when(() => comment.isExpanded).thenReturn(true);
        final model = createSubject();
        expect(
          model.threadBottomPadding,
          AppSpacing.sm,
        );
      });

      test('returns correct value '
          'when !comment.isExpanded', () {
        when(() => comment.isExpanded).thenReturn(false);
        final model = createSubject();
        expect(
          model.threadBottomPadding,
          AppSpacing.xs,
        );
      });

      group('backgroundColor', () {
        test('returns correct value when isSelected', () {
          const highlight = Colors.red;
          when(() => colorScheme.highlight).thenReturn(highlight);
          final model = createSubject();
          expect(
            model.backgroundColor(
              colorScheme: colorScheme,
              isSelected: true,
            ),
            highlight,
          );
        });

        test('returns null when !isSelected', () {
          final model = createSubject();
          expect(
            model.backgroundColor(
              colorScheme: colorScheme,
              isSelected: false,
            ),
            null,
          );
        });
      });
    });
  });
}
