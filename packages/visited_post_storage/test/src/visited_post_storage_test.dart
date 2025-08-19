// ignore_for_file: prefer_const_constructors

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

import '../test_database.dart';

void main() {
  final visitedPosts = {'postId'};

  group(VisitedPostStorage, () {
    late TestDatabase database;
    late VisitedPostStorage storage;

    setUp(() async {
      database = TestDatabase(
        DatabaseConnection(
          NativeDatabase.memory(),
          closeStreamsSynchronously: true,
        ),
      );

      await database
          .into(database.visitedPosts)
          .insert(
            VisitedPostsCompanion.insert(
              postId: 'postId',
            ),
          );

      storage = await VisitedPostStorage.open(database);
    });

    tearDown(() async {
      await database.close();
    });

    group('tables', () {
      test('has correct values', () {
        expect(
          VisitedPostStorage.tables,
          [
            VisitedPosts,
          ],
        );
      });
    });

    group('read', () {
      test('returns visited posts', () async {
        expect(storage.read(), visitedPosts);
      });
    });

    group('add', () {
      test('inserts visited post correctly '
          'when postId is not present', () async {
        final selectStatement = database.select(database.visitedPosts);

        final initialPosts = await selectStatement.get();
        expect(initialPosts.length, 1);

        const newPostId = 'newPostId';
        await storage.add(newPostId);

        final updatedPosts = await selectStatement.get();
        expect(updatedPosts.length, 2);
      });

      test('ignores insert when when postId '
          'is already present', () async {
        final selectStatement = database.select(database.visitedPosts);

        final initialPosts = await selectStatement.get();
        expect(initialPosts.length, 1);

        await storage.add('postId');

        final updatedPosts = await selectStatement.get();
        expect(updatedPosts.length, 1);
      });
    });

    group('watch', () {
      test('returns stream', () {
        final visitedPost = VisitedPostDataPlaceholder(
          postId: 'newPostId',
        );
        final stream = storage.watch();
        database.into(database.visitedPosts).insert(visitedPost);
        expect(
          stream,
          emits(
            {
              ...visitedPosts,
              visitedPost.postId,
            },
          ),
        );
      });
    });
  });
}
