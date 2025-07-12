import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/external_links/external_links.dart';

void main() {
  group('yapPrivacyPolicyLink', () {
    test('has correct value', () {
      expect(
        yapPrivacyPolicyLink,
        'https://lukasmirbt.github.io/hacker_news/privacy_policy.html',
      );
    });
  });

  group('hackerNewsPrivacyPolicyLink', () {
    test('has correct value', () {
      expect(
        hackerNewsPrivacyPolicyLink,
        'https://www.ycombinator.com/legal/#privacy',
      );
    });
  });

  group('hackerNewsTermsLink', () {
    test('has correct value', () {
      expect(
        hackerNewsTermsLink,
        'https://www.ycombinator.com/legal/#tou',
      );
    });
  });
}
