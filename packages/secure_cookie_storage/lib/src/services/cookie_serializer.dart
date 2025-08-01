import 'dart:convert';

class CookieSerializer {
  const CookieSerializer();

  String serialize(Map<String, String> cookies) {
    return jsonEncode(cookies);
  }

  Map<String, String> deserialize(String json) {
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    final cookies = Map<String, String>.from(decoded);
    return cookies;
  }
}
