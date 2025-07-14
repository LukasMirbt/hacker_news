import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppFeedItemDataPlaceholder, () {
    AppFeedItemDataPlaceholder createSubject() {
      return AppFeedItemDataPlaceholder();
    }

    test('returns $AppFeedItemData', () {
      expect(
        createSubject(),
        isA<AppFeedItemData>(),
      );
    });

    group('onPressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onPressed, returnsNormally);
      });
    });

    group('onSharePressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onSharePressed, returnsNormally);
      });
    });

    group('onMorePressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onMorePressed, returnsNormally);
      });
    });
  });
}
