import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppFeedItemVoteButtonDataPlaceholder, () {
    AppFeedItemVoteButtonDataPlaceholder createSubject() {
      return AppFeedItemVoteButtonDataPlaceholder();
    }

    test('returns $AppFeedItemVoteButtonData', () {
      expect(
        createSubject(),
        isA<AppFeedItemVoteButtonData>(),
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
