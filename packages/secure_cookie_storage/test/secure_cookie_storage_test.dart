// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';

class _MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  const key = 'key';
  const value = 'value';
  final exception = Exception('oops');

  group(SecureCookieStorage, () {
    late FlutterSecureStorage secureStorage;

    setUp(() {
      secureStorage = _MockFlutterSecureStorage();
    });

    SecureCookieStorage createSubject() {
      return SecureCookieStorage(
        flutterSecureStorage: secureStorage,
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
      final read = () => secureStorage.read(key: key);

      test('returns value when secureStorage.read succeeds', () async {
        when(read).thenAnswer((_) async => value);
        final storage = createSubject();
        expect(
          storage.read(key),
          completion(value),
        );
        verify(read).called(1);
      });

      test('throws $SecureCookieStorageException '
          'when secureStorage.read throws $Exception', () async {
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
      final write = () => secureStorage.write(key: key, value: value);

      test('completes when secureStorage.write succeeds', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        expect(
          storage.write(key, value),
          completes,
        );
        verify(write).called(1);
      });

      test('throws $SecureCookieStorageException '
          'when secureStorage.write throws $Exception', () async {
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
      final delete = () => secureStorage.delete(key: key);

      test('completes when secureStorage.delete succeeds', () async {
        when(delete).thenAnswer((_) async {});
        expect(
          secureStorage.delete(key: key),
          completes,
        );
        verify(delete).called(1);
      });

      test('throws $SecureCookieStorageException '
          'when secureStorage.delete throws $Exception', () async {
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

    group('clear', () {
      final keys = ['first', 'second'];

      final delete = (String key) =>
          () => secureStorage.delete(key: key);

      test('completes when secureStorage.delete succeeds '
          'for each key', () async {
        for (final key in keys) {
          when(delete(key)).thenAnswer((_) async {});
        }
        final storage = createSubject();
        await storage.deleteAll(keys);
        for (final key in keys) {
          verify(delete(key)).called(1);
        }
      });

      test('throws $SecureCookieStorageException '
          'when secureStorage.delete throws $Exception', () async {
        when(delete(keys.first)).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.deleteAll(keys),
          throwsA(
            SecureCookieStorageException(exception),
          ),
        );
        verify(delete(keys.first)).called(1);
      });
    });
  });
}
