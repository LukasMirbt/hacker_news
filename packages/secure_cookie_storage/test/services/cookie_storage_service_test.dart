// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';
import 'package:synchronized/synchronized.dart';

class _MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

class _MockCookieSerializer extends Mock implements CookieSerializer {}

class _MockLock extends Mock implements Lock {}

class _MockLogger extends Mock implements Logger {}

void main() {
  const storageKey = '__cookie_key__';

  const key = 'key';
  const value = 'value';
  final cookies = {key: value};

  group(CookieStorageService, () {
    late FlutterSecureStorage secureStorage;
    late CookieSerializer serializer;
    late Lock lock;
    late Logger logger;

    setUp(() {
      secureStorage = _MockFlutterSecureStorage();
      serializer = _MockCookieSerializer();
      lock = _MockLock();
      logger = _MockLogger();
    });

    CookieStorageService createSubject() {
      return CookieStorageService(
        secureStorage: secureStorage,
        serializer: serializer,
        cookies: cookies,
        lock: lock,
      );
    }

    group('open', () {
      Future<CookieStorageService> open() {
        return CookieStorageService.open(
          logger: logger,
          secureStorage: secureStorage,
          serializer: serializer,
        );
      }

      final read = () => secureStorage.read(key: storageKey);

      test('calls read and returns $CookieStorageService '
          'with empty cookies when json is null', () async {
        when(read).thenAnswer((_) async => null);
        final service = await open();
        expect(service.read(key), null);
        verify(read).called(1);
      });

      test('calls read, deserialize and returns $CookieStorageService '
          'with cookies when json is non-null', () async {
        const json = 'json';
        final deserialize = () => serializer.deserialize(json);
        when(read).thenAnswer((_) async => json);
        when(deserialize).thenReturn(cookies);
        final service = await open();
        expect(service.read(key), value);
        verify(read).called(1);
        verify(deserialize).called(1);
      });

      test('logs error and returns $CookieStorageService'
          'when read throws', () async {
        final exception = Exception('oops');
        when(read).thenThrow(exception);
        final service = await open();
        expect(service.read(key), null);
        verify(
          () => logger.severe(
            'Failed to read cookies from secure storage',
            exception,
            any(),
          ),
        ).called(1);
      });
    });

    group('read', () {
      test('returns value when non-null', () {
        final service = createSubject();
        expect(service.read(key), value);
      });

      test('returns null when value is null', () {
        final service = createSubject();
        expect(service.read(''), null);
      });
    });

    group('update', () {
      final synchronized = () => lock.synchronized<void>(any());

      final callFunction = (Invocation invocation) async {
        final callback =
            invocation.positionalArguments.first as Future<void> Function();
        await callback();
      };

      test('returns when updated cookies are equal to '
          'current cookies', () async {
        when(synchronized).thenAnswer(callFunction);
        final service = createSubject();
        await service.update((_) {});
        verifyNever(
          () => secureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        );
      });

      test('writes to secureStorage and updates cached cookies '
          'when updated cookies are not equal to current cookies', () async {
        const updatedValue = 'updatedValue';
        final updatedCookies = {key: updatedValue};
        const serializedCookies = 'serializedCookies';
        final serialize = () => serializer.serialize(updatedCookies);
        final write = () => secureStorage.write(
          key: storageKey,
          value: serializedCookies,
        );
        when(synchronized).thenAnswer(callFunction);
        when(serialize).thenReturn(serializedCookies);
        when(write).thenAnswer((_) async {});
        final service = createSubject();
        expect(service.read(key), value);
        await service.update((cookies) {
          cookies[key] = updatedValue;
        });
        verify(serialize).called(1);
        verify(write).called(1);
        expect(service.read(key), updatedValue);
      });
    });
  });
}
