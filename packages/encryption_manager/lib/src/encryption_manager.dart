import 'package:encryption_manager/encryption_manager.dart';
import 'package:hive_ce/hive.dart';

class EncryptionManager {
  EncryptionManager({
    EncryptionKeyService? encryptionKeyService,
  }) : _service = encryptionKeyService ?? EncryptionKeyService();

  final EncryptionKeyService _service;

  Future<HiveCipher> cipher() async {
    final encryptionKey = await _service.encryptionKey();
    return HiveAesCipher(encryptionKey);
  }
}
