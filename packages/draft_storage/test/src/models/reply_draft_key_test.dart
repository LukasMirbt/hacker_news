// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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

      group('filter', () {
        test('returns correct expression', () {
          const id = 1;
          final key = ReplyDraftById(id);
          final expression = _MockBoolExpression();
          final equalsId = () => idColumn.equals(id);
          when(() => table.id).thenReturn(idColumn);
          when(equalsId).thenReturn(expression);
          expect(key.filter(table), expression);
          verify(equalsId).called(1);
        });
      });
    });

    group(ReplyDraftByUniqueKeys, () {
      late GeneratedColumn<String> parentIdColumn;
      late GeneratedColumn<String> userIdColumn;

      setUp(() {
        parentIdColumn = _MockGeneratedStringColumn();
        userIdColumn = _MockGeneratedStringColumn();
      });

      group('filter', () {
        test('returns correct expression', () {
          const parentId = 'parentId';
          const userId = 'userId';
          final key = ReplyDraftByUniqueKeys(
            parentId: parentId,
            userId: userId,
          );
          final equalsParentIdExpression = _MockBoolExpression();
          final equalsUserIdExpression = _MockBoolExpression();
          final equalsParentId = () => parentIdColumn.equals(parentId);
          final equalsUserId = () => userIdColumn.equals(userId);
          when(() => table.parentId).thenReturn(parentIdColumn);
          when(() => table.userId).thenReturn(userIdColumn);
          when(equalsParentId).thenReturn(equalsParentIdExpression);
          when(equalsUserId).thenReturn(equalsUserIdExpression);
          expect(
            key.filter(table),
            equalsParentIdExpression & equalsUserIdExpression,
          );
          verify(equalsParentId).called(1);
          verify(equalsUserId).called(1);
        });
      });
    });
  });
}
