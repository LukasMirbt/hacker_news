// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  final items = [
    ThreadListItemPlaceholder(),
  ];

  const isInitial = false;

  group(ThreadList, () {
    group('initial', () {
      test('returns $ThreadList', () {
        expect(
          ThreadList.initial,
          ThreadList(
            items: [],
            nextPage: 1,
            isInitial: true,
            hasReachedMax: false,
          ),
        );
      });
    });

    group('isEmpty', () {
      test('returns true when !isInitial and items.isEmpty', () {
        final list = ThreadList(
          isInitial: false,
          items: [],
        );
        expect(list.isEmpty, true);
      });

      test('returns false when isInitial', () {
        final list = ThreadList(
          items: items,
          isInitial: true,
        );
        expect(list.isEmpty, false);
      });

      test('returns false when !items.isEmpty', () {
        final list = ThreadList(
          items: items,
          isInitial: isInitial,
        );
        expect(list.isEmpty, false);
      });
    });

    group('extendWith', () {
      const list = ThreadList.initial;

      test('returns extended list with !hasReachedMax '
          'when !nextList.isEmpty', () {
        final nextList = [
          ThreadListItemPlaceholder(),
        ];

        expect(
          list.extendWith(nextList),
          ThreadList(
            items: [...list.items, ...nextList],
            nextPage: list.nextPage + 1,
            hasReachedMax: false,
          ),
        );
      });

      test('returns extended list with hasReachedMax '
          'when nextList.isEmpty', () {
        final nextList = <ThreadListItem>[];

        expect(
          list.extendWith(nextList),
          ThreadList(
            items: list.items,
            nextPage: list.nextPage + 1,
            hasReachedMax: true,
          ),
        );
      });
    });
  });
}
