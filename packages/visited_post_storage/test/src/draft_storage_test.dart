// ignore_for_file: prefer_const_constructors

import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

import '../test_database.dart';

void main() {
  final now = DateTime(2025, 8, 11, 14, 43);

  group(VisitedPostStorage, () {
    late TestDatabase database;

    setUp(() {
      database = TestDatabase(
        DatabaseConnection(
          NativeDatabase.memory(),
          closeStreamsSynchronously: true,
        ),
      );
    });

    tearDown(() async {
      await database.close();
    });

    VisitedPostStorage createSubject() => VisitedPostStorage(database);

    group('tables', () {
      test('has correct values', () {
        expect(
          VisitedPostStorage.tables,
          [
            ReplyDrafts,
            CommentDrafts,
          ],
        );
      });
    });

    group('readReplyDraft', () {
      test('returns draft when non-null', () async {
        final draft = ReplyDraftDataPlaceholder();
        final key = ReplyDraftById(draft.id);
        await database.into(database.replyDrafts).insert(draft);
        final storage = createSubject();
        expect(
          storage.readReplyDraft(key),
          completion(draft),
        );
      });

      test('returns null when draft is null', () async {
        final key = ReplyDraftById(1);
        final storage = createSubject();
        expect(
          storage.readReplyDraft(key),
          completion(null),
        );
      });
    });

    group('readCommentDraft', () {
      test('returns draft when non-null', () async {
        final draft = CommentDraftDataPlaceholder();
        final key = CommentDraftById(draft.id);
        await database.into(database.commentDrafts).insert(draft);
        final storage = createSubject();
        expect(
          storage.readCommentDraft(key),
          completion(draft),
        );
      });

      test('returns null when draft is null', () async {
        final key = CommentDraftById(1);
        final storage = createSubject();
        expect(
          storage.readCommentDraft(key),
          completion(null),
        );
      });
    });

    group('saveReplyDraft', () {
      const parentId = 'parentId';
      const userId = 'userId';
      const url = 'url';
      const parentHtmlText = 'parentHtmlText';
      const content = 'content';

      test('inserts draft correctly when there is no conflict', () async {
        await withClock(Clock.fixed(now), () async {
          final storage = createSubject();

          await storage.saveReplyDraft(
            ReplyDraftsCompanion.insert(
              parentId: parentId,
              userId: userId,
              url: url,
              parentHtmlText: parentHtmlText,
              content: content,
            ),
          );

          final key = ReplyDraftByUniqueKeys(
            parentId: parentId,
            userId: userId,
          );

          final selectStatement = database.select(database.replyDrafts)
            ..where(key.filter);

          final draft = await selectStatement.getSingle();

          expect(
            draft,
            ReplyDraftData(
              id: 1,
              parentId: parentId,
              userId: userId,
              updatedAt: now.toUtc(),
              url: url,
              parentHtmlText: parentHtmlText,
              content: content,
            ),
          );
        });
      });

      test('updates draft correctly when there is a conflict', () async {
        await withClock(Clock.fixed(now), () async {
          await database
              .into(database.replyDrafts)
              .insert(
                ReplyDraftsCompanion.insert(
                  parentId: parentId,
                  userId: userId,
                  url: url,
                  parentHtmlText: parentHtmlText,
                  content: content,
                  updatedAt: Value(DateTime(2024)),
                ),
              );

          final storage = createSubject();

          const updatedContent = 'updatedContent';
          const updatedUrl = 'updatedUrl';
          const updatedParentHtmlText = 'updatedParentHtmlText';

          await storage.saveReplyDraft(
            ReplyDraftsCompanion.insert(
              parentId: parentId,
              userId: userId,
              url: updatedUrl,
              parentHtmlText: updatedParentHtmlText,
              content: updatedContent,
            ),
          );

          final key = ReplyDraftByUniqueKeys(
            parentId: parentId,
            userId: userId,
          );

          final selectStatement = database.select(database.replyDrafts)
            ..where(key.filter);

          final draft = await selectStatement.getSingle();

          expect(
            draft,
            ReplyDraftData(
              id: 1,
              parentId: parentId,
              userId: userId,
              updatedAt: now.toUtc(),
              url: updatedUrl,
              parentHtmlText: updatedParentHtmlText,
              content: updatedContent,
            ),
          );
        });
      });
    });

    group('saveCommentDraft', () {
      const parentId = 'parentId';
      const userId = 'userId';
      const postTitle = 'postTitle';
      const content = 'content';

      test('inserts draft correctly when there is no conflict', () async {
        await withClock(Clock.fixed(now), () async {
          final storage = createSubject();

          await storage.saveCommentDraft(
            CommentDraftsCompanion.insert(
              parentId: parentId,
              userId: userId,
              postTitle: postTitle,
              content: content,
            ),
          );

          final key = CommentDraftByUniqueKeys(
            parentId: parentId,
            userId: userId,
          );

          final selectStatement = database.select(database.commentDrafts)
            ..where(key.filter);

          final draft = await selectStatement.getSingle();

          expect(
            draft,
            CommentDraftData(
              id: 1,
              userId: userId,
              parentId: parentId,
              updatedAt: now.toUtc(),
              postTitle: postTitle,
              content: content,
            ),
          );
        });
      });

      test('updates draft correctly when there is a conflict', () async {
        await withClock(Clock.fixed(now), () async {
          await database
              .into(database.commentDrafts)
              .insert(
                CommentDraftsCompanion.insert(
                  parentId: parentId,
                  userId: userId,
                  postTitle: postTitle,
                  content: content,
                  updatedAt: Value(DateTime(2024)),
                ),
              );

          final storage = createSubject();

          const updatedContent = 'updatedContent';
          const updatedPostTitle = 'updatedPostTitle';

          await storage.saveCommentDraft(
            CommentDraftsCompanion.insert(
              parentId: parentId,
              userId: userId,
              postTitle: updatedPostTitle,
              content: updatedContent,
            ),
          );

          final key = CommentDraftByUniqueKeys(
            parentId: parentId,
            userId: userId,
          );

          final selectStatement = database.select(database.commentDrafts)
            ..where(key.filter);

          final draft = await selectStatement.getSingle();

          expect(
            draft,
            CommentDraftData(
              id: 1,
              parentId: parentId,
              userId: userId,
              updatedAt: now.toUtc(),
              postTitle: updatedPostTitle,
              content: updatedContent,
            ),
          );
        });
      });
    });

    group('deleteReplyDraft', () {
      test('deletes draft', () async {
        final draft = ReplyDraftDataPlaceholder();
        final key = ReplyDraftById(draft.id);
        final storage = createSubject();

        await database.into(database.replyDrafts).insert(draft);

        final selectStatement = database.select(database.replyDrafts)
          ..where(key.filter);

        await expectLater(
          selectStatement.getSingleOrNull(),
          completion(
            isA<ReplyDraftData>(),
          ),
        );

        await storage.deleteReplyDraft(key);

        await expectLater(
          selectStatement.getSingleOrNull(),
          completion(null),
        );
      });
    });

    group('deleteCommentDraft', () {
      test('deletes draft', () async {
        final draft = CommentDraftDataPlaceholder();
        final key = CommentDraftById(draft.id);
        final storage = createSubject();

        await database.into(database.commentDrafts).insert(draft);

        final selectStatement = database.select(database.commentDrafts)
          ..where(key.filter);

        await expectLater(
          selectStatement.getSingleOrNull(),
          completion(
            isA<CommentDraftData>(),
          ),
        );

        await storage.deleteCommentDraft(key);

        await expectLater(
          selectStatement.getSingleOrNull(),
          completion(null),
        );
      });
    });

    group('watchReplyDrafts', () {
      test('returns stream', () {
        final storage = createSubject();
        final draft = ReplyDraftDataPlaceholder();
        final stream = storage.watchReplyDrafts();
        database.into(database.replyDrafts).insert(draft);
        expect(stream, emits([draft]));
      });
    });

    group('watchCommentDrafts', () {
      test('returns stream', () {
        final storage = createSubject();
        final draft = CommentDraftDataPlaceholder();
        final stream = storage.watchCommentDrafts();
        database.into(database.commentDrafts).insert(draft);
        expect(stream, emits([draft]));
      });
    });
  });
}
