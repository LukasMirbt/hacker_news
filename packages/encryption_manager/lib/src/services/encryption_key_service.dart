import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';

class EncryptionKeyService {
  EncryptionKeyService({
    HiveInterface? hive,
    FlutterSecureStorage? flutterSecureStorage,
    Base64Codec? codec,
  }) : _hive = hive ?? Hive,
       _codec = codec ?? base64Url,
       _storage = flutterSecureStorage ?? const FlutterSecureStorage();

  static const _key = '__encryption_key_key__';

  final HiveInterface _hive;
  final Base64Codec _codec;
  final FlutterSecureStorage _storage;

  Future<List<int>> encryptionKey() async {
    final encryptionKeyString = await _storage.read(key: _key);

    if (encryptionKeyString != null) {
      return _codec.decode(encryptionKeyString);
    } else {
      final key = _hive.generateSecureKey();

      await _storage.write(
        key: _key,
        value: _codec.encode(key),
      );

      return key;
    }
  }
}
