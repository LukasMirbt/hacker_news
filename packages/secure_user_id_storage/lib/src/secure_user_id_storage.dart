import 'package:equatable/equatable.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';

class SecureUserIdStorageException with EquatableMixin implements Exception {
  const SecureUserIdStorageException(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class SecureUserIdStorage {
  SecureUserIdStorage({
    required UserIdStorageService storageService,
  }) : _storageService = storageService;

  final UserIdStorageService _storageService;

  String? read() {
    try {
      final userId = _storageService.read();
      return userId;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureUserIdStorageException(error),
        stackTrace,
      );
    }
  }

  Future<void> write(String userId) async {
    try {
      await _storageService.update(userId);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureUserIdStorageException(error),
        stackTrace,
      );
    }
  }

  Future<void> delete() async {
    try {
      await _storageService.delete();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureUserIdStorageException(error),
        stackTrace,
      );
    }
  }
}
