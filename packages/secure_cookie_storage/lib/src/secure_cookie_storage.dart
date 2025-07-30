import 'package:cookie_jar/cookie_jar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCookieStorageException with EquatableMixin implements Exception {
  const SecureCookieStorageException(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class SecureCookieStorage implements Storage {
  const SecureCookieStorage({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _secureStorage = flutterSecureStorage;

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      return value;
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    try {
      for (final key in keys) {
        await _secureStorage.delete(key: key);
      }
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SecureCookieStorageException(error),
        stackTrace,
      );
    }
  }
}
