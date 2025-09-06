import 'package:app/external_links/external_links.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('axiomPrivacyPolicyLink', () {
    test('has correct value', () {
      expect(
        axiomPrivacyPolicyLink,
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
