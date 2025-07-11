import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/external_links/external_links.dart';

void main() {
  group('privacyPolicyLink', () {
    test('has correct value', () {
      expect(
        privacyPolicyLink,
        'https://lukasmirbt.github.io/hacker_news/privacy_policy.html',
      );
    });
  });
}
