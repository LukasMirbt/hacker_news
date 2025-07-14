import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppFeedItemCommentCountButtonDataPlaceholder, () {
    AppFeedItemCommentCountButtonDataPlaceholder createSubject() {
      return AppFeedItemCommentCountButtonDataPlaceholder();
    }

    test('returns $AppFeedItemCommentCountButtonData', () {
      expect(
        createSubject(),
        isA<AppFeedItemCommentCountButtonData>(),
      );
    });

    group('onPressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onPressed, returnsNormally);
      });
    });
  });
}
