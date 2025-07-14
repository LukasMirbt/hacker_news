import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppPostHeaderDataPlaceholder, () {
    AppPostHeaderDataPlaceholder createSubject() {
      return AppPostHeaderDataPlaceholder();
    }

    test('returns $AppPostHeaderData', () {
      expect(
        createSubject(),
        isA<AppPostHeaderData>(),
      );
    });

    group('onPressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onPressed, returnsNormally);
      });
    });

    group('onTextLinkPressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(
          () => data.onTextLinkPressed(''),
          returnsNormally,
        );
      });
    });

    group('onSharePressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onSharePressed, returnsNormally);
      });
    });
  });
}
