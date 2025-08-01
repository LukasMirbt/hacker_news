// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';

class _MockUserIdStorageService extends Mock implements UserIdStorageService {}

void main() {
  const userId = 'userId';
  final exception = Exception('oops');

  group(SecureUserIdStorage, () {
    late UserIdStorageService storageService;

    setUp(() {
      storageService = _MockUserIdStorageService();
    });

    SecureUserIdStorage createSubject() {
      return SecureUserIdStorage(
        storageService: storageService,
      );
    }

    group('read', () {
      final read = () => storageService.read();

      test('returns userId when storageService.read succeeds', () async {
        when(read).thenReturn(userId);
        final storage = createSubject();
        expect(storage.read(), userId);
        verify(read).called(1);
      });

      test('throws $SecureUserIdStorageException '
          'when storageService.read fails', () async {
        when(read).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.read,
          throwsA(
            SecureUserIdStorageException(exception),
          ),
        );
        verify(read).called(1);
      });
    });

    group('write', () {
      final write = () => storageService.update(userId);

      test('completes when storageService.update succeeds', () async {
        when(write).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.write(userId);
        verify(write).called(1);
      });

      test('throws $SecureUserIdStorageException '
          'when storageService.update fails', () async {
        when(write).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.write(userId),
          throwsA(
            SecureUserIdStorageException(exception),
          ),
        );
        verify(write).called(1);
      });
    });

    group('delete', () {
      final delete = () => storageService.delete();

      test('completes when storageService.update succeeds', () async {
        when(delete).thenAnswer((_) async {});
        final storage = createSubject();
        await storage.delete();
        verify(delete).called(1);
      });

      test('throws $SecureUserIdStorageException '
          'when storageService.update fails', () async {
        when(delete).thenThrow(exception);
        final storage = createSubject();
        expect(
          storage.delete(),
          throwsA(
            SecureUserIdStorageException(exception),
          ),
        );
        verify(delete).called(1);
      });
    });
  });
}
