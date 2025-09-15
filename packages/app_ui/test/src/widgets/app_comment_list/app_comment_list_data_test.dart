import 'package:app_ui/src/widgets/app_comment_list/app_comment_list.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestComment extends Fake implements Collapsible<dynamic> {
  _TestComment({
    required this.indent,
  });

  @override
  final int indent;
}

void main() {
  group(AppCommentListData, () {
    AppCommentListData createSubject({
      int? selectedIndex,
      List<Collapsible<dynamic>>? items,
    }) {
      return AppCommentListData(
        selectedIndex: selectedIndex,
        items: items ?? [],
        containerBuilder: (_, _) => Container(),
        commentBuilder: (_, _) => Container(),
      );
    }

    group('isSelected', () {
      test('returns true when index == selectedIndex', () {
        const selectedIndex = 1;
        final subject = createSubject(
          selectedIndex: selectedIndex,
        );
        expect(
          subject.isSelected(selectedIndex),
          true,
        );
      });

      test('returns false when index does not match selectedIndex', () {
        final subject = createSubject(
          selectedIndex: 1,
        );
        expect(
          subject.isSelected(2),
          false,
        );
      });
    });

    group('isStartOfThread', () {
      final items = [
        _TestComment(indent: 1),
        _TestComment(indent: 0),
      ];

      test('returns false when comment is null', () {
        final data = createSubject(items: items);
        expect(data.isStartOfThread(2), false);
      });

      test('returns true when comment is non-null '
          'and indent == 0', () {
        final data = createSubject(items: items);
        expect(data.isStartOfThread(1), true);
      });

      test('returns false when comment is non-null '
          'and indent != 0', () {
        final data = createSubject(items: items);
        expect(data.isStartOfThread(0), false);
      });
    });

    group('isEndOfThread', () {
      final items = [
        _TestComment(indent: 0),
        _TestComment(indent: 1),
        _TestComment(indent: 0),
      ];

      test('returns true when nextComment is null', () {
        final data = createSubject(items: items);
        expect(data.isEndOfThread(2), true);
      });

      test('returns true when nextComment is non-null '
          'and indent == 0', () {
        final data = createSubject(items: items);
        expect(data.isEndOfThread(1), true);
      });

      test('returns false when nextComment is non-null '
          'and indent != 0', () {
        final data = createSubject(items: items);
        expect(data.isEndOfThread(0), false);
      });
    });

    group('isEndOfList', () {
      final items = [
        _TestComment(indent: 0),
        _TestComment(indent: 1),
        _TestComment(indent: 0),
      ];

      test('returns true when index is last', () {
        final data = createSubject(items: items);
        expect(data.isEndOfList(2), true);
      });

      test('returns false when index is not last', () {
        final data = createSubject(items: items);
        expect(data.isEndOfList(1), false);
      });
    });
  });
}
