// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:secure_cookie_storage/secure_cookie_storage.dart';

void main() {
  final cookies = {'key': 'value'};
  const json = '{"key":"value"}';

  group(CookieSerializer, () {
    CookieSerializer createSubject() => CookieSerializer();

    group('serialize', () {
      test('returns correct value', () {
        final serializer = createSubject();
        final result = serializer.serialize(cookies);
        expect(result, json);
      });
    });

    group('deserialize', () {
      test('returns correct value', () {
        final serializer = createSubject();
        final result = serializer.deserialize(json);
        expect(result, cookies);
      });
    });
  });
}
