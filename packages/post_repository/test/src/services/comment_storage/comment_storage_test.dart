// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockHiveInterface extends Mock implements HiveInterface {}

class _MockBox extends Mock implements Box<String> {}

void main() {
  final storageKey = CommentStorageKey(
    parentId: 'parentId',
    userId: 'userId',
  );

  group(CommentStorage, () {
    late HiveInterface hive;
    late Box<String> box;

    setUp(() {
      hive = _MockHiveInterface();
      box = _MockBox();
    });

    CommentStorage createSubject() {
      return CommentStorage(box: box);
    }

    group('init', () {
      final openBox = () => hive.openBox<String>('commentStorage');

      test('calls openBox and returns $CommentStorage', () {
        when(openBox).thenAnswer((_) async => box);
        expect(
          CommentStorage.init(hive),
          completion(
            isA<CommentStorage>(),
          ),
        );
        verify(openBox).called(1);
      });
    });

    group('save', () {
      const text = 'text';
      final put = () => box.put(storageKey.key, text);

      test('calls box.put', () async {
        when(put).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.save(
          storageKey: storageKey,
          text: text,
        );
        verify(put).called(1);
      });
    });

    group('read', () {
      final get = () => box.get(storageKey.key);

      test('calls box.get and returns value', () {
        when(get).thenReturn('text');
        final storage = createSubject();
        expect(storage.read(storageKey), 'text');
        verify(get).called(1);
      });
    });

    group('clear', () {
      final delete = () => box.delete(storageKey.key);

      test('calls box.delete', () async {
        when(delete).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.clear(storageKey);
        verify(delete).called(1);
      });
    });
  });
}
