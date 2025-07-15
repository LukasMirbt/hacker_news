import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppCommentDataPlaceholder, () {
    AppCommentDataPlaceholder createSubject() {
      return AppCommentDataPlaceholder();
    }

    test('returns $AppCommentData', () {
      expect(
        createSubject(),
        isA<AppCommentData>(),
      );
    });

    group('onHeaderPressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onHeaderPressed, returnsNormally);
      });
    });

    group('onMorePressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onMorePressed, returnsNormally);
      });
    });

    group('onLinkPressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(
          () => data.onLinkPressed(''),
          returnsNormally,
        );
      });
    });

    group('onVotePressed', () {
      test('returns normally', () {
        final data = createSubject();
        expect(data.onVotePressed, returnsNormally);
      });
    });
  });
}
