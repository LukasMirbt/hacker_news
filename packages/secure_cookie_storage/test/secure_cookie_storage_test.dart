// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';

class _MockCookieStorageService extends Mock implements CookieStorageService {}

void main() {
  const key = 'key';
  const value = 'value';
  final exception = Exception('oops');

  group(SecureCookieStorage, () {
    late CookieStorageService storageService;

    setUp(() {
      storageService = _MockCookieStorageService();
    });

    SecureCookieStorage createSubject() {
      return SecureCookieStorage(
        storageService: storageService,
      );
    }

    group('init', () {
      test('completes', () {
        final storage = createSubject();
        expect(
          storage.init(false, false),
          completes,
        );
      });
    });

    group('read', () {
      final read = () => storageService.read(key);

      test('returns value when storageService.read succeeds', () async {
        when(read).thenReturn(value);
        final storage = createSubject();
        await expectLater(
          storage.read(key),
          completion(value),
        );
        verify(read).called(1);
      });

      test('throws $SecureCookieStorageException '
          'when storageService.read fails', () async {
        when(read).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.read(key),
          throwsA(
            SecureCookieStorageException(exception),
          ),
        );
        verify(read).called(1);
      });
    });

    group('write', () {
      final write = () => storageService.update(captureAny());

      test('completes when storageService.update succeeds', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.write(key, value);
        final update =
            verify(write).captured.single as void Function(Map<String, String>);
        final cookies = {key: 'previousValue'};
        update(cookies);
        expect(cookies, {key: value});
      });

      test('throws $SecureCookieStorageException '
          'when storageService.update fails', () async {
        when(write).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.write(key, value),
          throwsA(
            SecureCookieStorageException(exception),
          ),
        );
        verify(write).called(1);
      });
    });

    group('delete', () {
      final delete = () => storageService.update(captureAny());

      test('completes when storageService.update succeeds', () async {
        when(delete).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.delete(key);
        final update =
            verify(delete).captured.single
                as void Function(Map<String, String>);
        final cookies = {key: value};
        update(cookies);
        expect(cookies, <String, String>{});
      });

      test('throws $SecureCookieStorageException '
          'when storageService.update fails', () async {
        when(delete).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.delete(key),
          throwsA(
            SecureCookieStorageException(exception),
          ),
        );
        verify(delete).called(1);
      });
    });

    group('deleteAll', () {
      final deleteAll = () => storageService.update(captureAny());

      test('completes when storageService.update succeeds', () async {
        final entries = [
          MapEntry('firstKey', 'firstValue'),
          MapEntry('secondKey', 'secondValue'),
          MapEntry('thirdKey', 'thirdValue'),
        ];

        final keysToDelete = [
          entries[1].key,
          entries[2].key,
        ];

        when(deleteAll).thenAnswer((_) async {});
        final storage = createSubject();

        await storage.deleteAll(keysToDelete);

        final update =
            verify(deleteAll).captured.single
                as void Function(Map<String, String>);

        final cookies = Map.fromEntries(entries);

        update(cookies);

        expect(
          cookies,
          Map.fromEntries([entries[0]]),
        );
      });

      test('throws $SecureCookieStorageException '
          'when storageService.update fails', () async {
        when(deleteAll).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.deleteAll([key]),
          throwsA(
            SecureCookieStorageException(exception),
          ),
        );
        verify(deleteAll).called(1);
      });
    });
  });
}
