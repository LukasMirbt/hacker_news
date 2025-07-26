// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockHiveInterface extends Mock implements HiveInterface {}

class _MockBox extends Mock implements Box<String> {}

void main() {
  final key = CommentKey(
    postId: 'postId',
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
      final openBox = () => hive.openBox<String>(CommentStorage.boxName);

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
      final put = () => box.put(key.value, text);

      test('calls box.put', () async {
        when(put).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.save(key: key, text: text);
        verify(put).called(1);
      });
    });

    group('read', () {
      final get = () => box.get(key.value);

      test('calls box.get and returns value', () {
        when(get).thenReturn('text');
        final storage = createSubject();
        expect(storage.read(key), 'text');
        verify(get).called(1);
      });
    });

    group('clear', () {
      final delete = () => box.delete(key.value);

      test('calls box.delete', () async {
        when(delete).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.clear(key);
        verify(delete).called(1);
      });
    });
  });
}
