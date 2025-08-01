import 'package:cookie_jar/cookie_jar.dart';
import 'package:equatable/equatable.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';

class SecureCookieStorageException with EquatableMixin implements Exception {
  const SecureCookieStorageException(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class SecureCookieStorage implements Storage {
  SecureCookieStorage({
    required CookieStorageService storageService,
  }) : _storageService = storageService;

  final CookieStorageService _storageService;

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) async {
    try {
      final value = _storageService.read(key);
      return value;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> write(String key, String value) async {
    try {
      await _storageService.update(
        (cookies) {
          cookies[key] = value;
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storageService.update(
        (cookies) {
          cookies.remove(key);
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    try {
      await _storageService.update(
        (cookies) {
          for (final key in keys) {
            cookies.remove(key);
          }
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }
}
