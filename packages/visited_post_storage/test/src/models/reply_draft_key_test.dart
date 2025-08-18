// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

class _Mock$ReplyDraftsTable extends Mock implements $ReplyDraftsTable {}

class _MockGeneratedIntColumn extends Mock implements GeneratedColumn<int> {}

class _MockGeneratedStringColumn extends Mock
    implements GeneratedColumn<String> {}

class _MockBoolExpression extends Mock implements Expression<bool> {}

void main() {
  group(ReplyDraftKey, () {
    late $ReplyDraftsTable table;

    setUp(() {
      table = _Mock$ReplyDraftsTable();
    });

    group(ReplyDraftById, () {
      late GeneratedColumn<int> idColumn;

      setUp(() {
        table = _Mock$ReplyDraftsTable();
        idColumn = _MockGeneratedIntColumn();
      });

      const id = 1;

      ReplyDraftById createSubject() => ReplyDraftById(id);

      group('filter', () {
        test('returns correct expression', () {
          final expression = _MockBoolExpression();
          final equalsId = () => idColumn.equals(id);
          when(() => table.id).thenReturn(idColumn);
          when(equalsId).thenReturn(expression);
          final key = createSubject();
          expect(key.filter(table), expression);
          verify(equalsId).called(1);
        });
      });

      test('is equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, true);
      });
    });

    group(ReplyDraftByUniqueKeys, () {
      late GeneratedColumn<String> parentIdColumn;
      late GeneratedColumn<String> userIdColumn;

      setUp(() {
        parentIdColumn = _MockGeneratedStringColumn();
        userIdColumn = _MockGeneratedStringColumn();
      });

      const parentId = 'parentId';
      const userId = 'userId';

      ReplyDraftByUniqueKeys createSubject() {
        return ReplyDraftByUniqueKeys(
          parentId: parentId,
          userId: userId,
        );
      }

      group('filter', () {
        test('returns correct expression', () {
          final equalsParentIdExpression = _MockBoolExpression();
          final equalsUserIdExpression = _MockBoolExpression();
          final equalsParentId = () => parentIdColumn.equals(parentId);
          final equalsUserId = () => userIdColumn.equals(userId);
          when(() => table.parentId).thenReturn(parentIdColumn);
          when(() => table.userId).thenReturn(userIdColumn);
          when(equalsParentId).thenReturn(equalsParentIdExpression);
          when(equalsUserId).thenReturn(equalsUserIdExpression);
          final key = createSubject();
          expect(
            key.filter(table),
            equalsParentIdExpression & equalsUserIdExpression,
          );
          verify(equalsParentId).called(1);
          verify(equalsUserId).called(1);
        });
      });

      test('is equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, true);
      });
    });
  });
}
