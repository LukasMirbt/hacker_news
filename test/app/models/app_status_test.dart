import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app/app.dart';

void main() {
  group(AppStatus, () {
    group('initial', () {
      test('returns correct value', () {
        expect(
          AppStatus.initial,
          AppStatus.analyticsConsent,
        );
      });
    });
  });
}
