// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _Mock$CommentDraftsTable extends Mock implements $CommentDraftsTable {}

class _MockGeneratedIntColumn extends Mock implements GeneratedColumn<int> {}

class _MockGeneratedStringColumn extends Mock
    implements GeneratedColumn<String> {}

class _MockBoolExpression extends Mock implements Expression<bool> {}

void main() {
  group(CommentDraftKey, () {
    late $CommentDraftsTable table;

    setUp(() {
      table = _Mock$CommentDraftsTable();
    });

    group(CommentDraftById, () {
      late GeneratedColumn<int> idColumn;

      setUp(() {
        table = _Mock$CommentDraftsTable();
        idColumn = _MockGeneratedIntColumn();
      });

      const id = 1;

      CommentDraftById createSubject() => CommentDraftById(id);

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

    group(CommentDraftByUniqueKeys, () {
      late GeneratedColumn<String> postIdColumn;
      late GeneratedColumn<String> userIdColumn;

      setUp(() {
        postIdColumn = _MockGeneratedStringColumn();
        userIdColumn = _MockGeneratedStringColumn();
      });

      const postId = 'postId';
      const userId = 'userId';

      CommentDraftByUniqueKeys createSubject() {
        return CommentDraftByUniqueKeys(
          postId: postId,
          userId: userId,
        );
      }

      group('filter', () {
        test('returns correct expression', () {
          final equalsPostIdExpression = _MockBoolExpression();
          final equalsUserIdExpression = _MockBoolExpression();
          final equalsPostId = () => postIdColumn.equals(postId);
          final equalsUserId = () => userIdColumn.equals(userId);
          when(() => table.postId).thenReturn(postIdColumn);
          when(() => table.userId).thenReturn(userIdColumn);
          when(equalsPostId).thenReturn(equalsPostIdExpression);
          when(equalsUserId).thenReturn(equalsUserIdExpression);
          final key = createSubject();
          expect(
            key.filter(table),
            equalsPostIdExpression & equalsUserIdExpression,
          );
          verify(equalsPostId).called(1);
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
