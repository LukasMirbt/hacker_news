import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/external_links/external_links.dart';

void main() {
  group('privacyPolicyLink', () {
    test('has correct value', () {
      expect(
        privacyPolicyLink,
        'https://github.com/LukasMirbt/hacker_news/blob/privacy_policy.html',
      );
    });
  });
}
