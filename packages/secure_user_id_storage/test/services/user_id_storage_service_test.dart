// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';
import 'package:synchronized/synchronized.dart';

class _MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

class _MockLock extends Mock implements Lock {}

class _MockLogger extends Mock implements Logger {}

void main() {
  const storageKey = '__user_id_key__';
  const userId = 'userId';

  group(UserIdStorageService, () {
    late FlutterSecureStorage secureStorage;
    late Lock lock;
    late Logger logger;

    setUp(() {
      secureStorage = _MockFlutterSecureStorage();
      lock = _MockLock();
      logger = _MockLogger();
    });

    UserIdStorageService createSubject({
      required String? userId,
    }) {
      return UserIdStorageService(
        userId: userId,
        secureStorage: secureStorage,
        lock: lock,
      );
    }

    final synchronized = () => lock.synchronized<void>(any());

    final callFunction = (Invocation invocation) async {
      final callback =
          invocation.positionalArguments.first as Future<void> Function();
      await callback();
    };

    group('open', () {
      Future<UserIdStorageService> open() {
        return UserIdStorageService.open(
          logger: logger,
          secureStorage: secureStorage,
        );
      }

      final read = () => secureStorage.read(key: storageKey);

      test('calls read and returns $UserIdStorageService '
          'with null userId when json is null', () async {
        when(read).thenAnswer((_) async => null);
        final service = await open();
        expect(service.read(), null);
        verify(read).called(1);
      });

      test('calls read and returns $UserIdStorageService '
          'with userId when non-null', () async {
        when(read).thenAnswer((_) async => userId);
        final service = await open();
        expect(service.read(), userId);
        verify(read).called(1);
      });

      test('logs error and returns $UserIdStorageService'
          'when read throws', () async {
        final exception = Exception('oops');
        when(read).thenThrow(exception);
        final service = await open();
        expect(service.read(), null);
        verify(
          () => logger.severe(
            'Failed to read userId from secure storage',
            exception,
            any(),
          ),
        ).called(1);
      });
    });

    group('read', () {
      test('returns userId when non-null', () {
        final service = createSubject(userId: userId);
        expect(service.read(), userId);
      });

      test('returns null when userId is null', () {
        final service = createSubject(userId: null);
        expect(service.read(), null);
      });
    });

    group('update', () {
      test('returns when updatedUserId is equal to '
          'current userId', () async {
        when(synchronized).thenAnswer(callFunction);
        final service = createSubject(userId: userId);
        await service.update(userId);
        verifyNever(
          () => secureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        );
      });

      test('writes to secureStorage and updates cached userId '
          'when updatedUserId is not equal to current userId', () async {
        const updatedUserId = 'updatedUserId';
        final write = () => secureStorage.write(
          key: storageKey,
          value: updatedUserId,
        );
        when(synchronized).thenAnswer(callFunction);
        when(write).thenAnswer((_) async {});
        final service = createSubject(userId: userId);
        expect(service.read(), userId);
        await service.update(updatedUserId);
        verify(write).called(1);
        expect(service.read(), updatedUserId);
      });
    });

    group('delete', () {
      test('returns when userId is null', () async {
        when(synchronized).thenAnswer(callFunction);
        final service = createSubject(userId: null);
        await service.delete();
        verifyNever(
          () => secureStorage.delete(
            key: any(named: 'key'),
          ),
        );
      });
    });

    test('calls secureStorage.delete and updates cached userId '
        'when updatedUserId is not equal to current userId', () async {
      final delete = () => secureStorage.delete(key: storageKey);
      when(synchronized).thenAnswer(callFunction);
      when(delete).thenAnswer((_) async {});
      final service = createSubject(userId: userId);
      expect(service.read(), userId);
      await service.delete();
      verify(delete).called(1);
      expect(service.read(), null);
    });
  });
}
