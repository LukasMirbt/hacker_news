import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(LoginRedirect, () {
    group('constructor', () {
      LoginRedirect createSubject() => LoginRedirect();

      test('is not equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, false);
      });
    });

    group('initial', () {
      LoginRedirect createSubject() => LoginRedirect.initial;

      test('is equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, true);
      });
    });
  });
}
