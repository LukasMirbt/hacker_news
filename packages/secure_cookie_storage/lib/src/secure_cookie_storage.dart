import 'package:cookie_jar/cookie_jar.dart';
import 'package:hive_ce/hive.dart';

class CookieStorage implements Storage {
  const CookieStorage({
    required Box<String> box,
  }) : _box = box;

  static Future<CookieStorage> open(
    HiveInterface hive,
    HiveCipher encryptionCipher,
  ) async {
    final box = await hive.openBox<String>(
      'cookieStorage',
      encryptionCipher: encryptionCipher,
    );
    return CookieStorage(box: box);
  }

  final Box<String> _box;

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) async {
    final stopwatch = Stopwatch()..start();
    final value = _box.get(key);
    stopwatch.stop();
    print('CookieStorage read: ${stopwatch.elapsedMilliseconds}');
    return value;
  }

  @override
  Future<void> write(String key, String value) async {
    final stopwatch = Stopwatch()..start();
    await _box.put(key, value);
    stopwatch.stop();
    print('CookieStorage write: ${stopwatch.elapsedMilliseconds}');
  }

  @override
  Future<void> delete(String key) async {
    final stopwatch = Stopwatch()..start();
    await _box.delete(key);
    stopwatch.stop();
    print('CookieStorage delete: ${stopwatch.elapsedMilliseconds}');
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    final stopwatch = Stopwatch()..start();
    for (final key in keys) {
      await _box.delete(key);
    }
    stopwatch.stop();
    print('CookieStorage deleteAll: ${stopwatch.elapsedMilliseconds}');
  }
}
