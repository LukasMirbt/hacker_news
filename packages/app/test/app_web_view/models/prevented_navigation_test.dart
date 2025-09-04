import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PreventedNavigation, () {
    group('constructor', () {
      PreventedNavigation createSubject() => PreventedNavigation(Uri());

      test('is not equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, false);
      });
    });

    group('empty', () {
      test('returns $PreventedNavigation', () {
        expect(
          PreventedNavigation.empty,
          isA<PreventedNavigation>(),
        );
      });
    });
  });
}
