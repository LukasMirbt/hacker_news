import 'package:app_ui/src/widgets/app_current_user_comment/app_current_user_comment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppCurrentUserCommentDataPlaceholder, () {
    AppCurrentUserCommentDataPlaceholder createSubject() {
      return AppCurrentUserCommentDataPlaceholder();
    }

    test('returns $AppCurrentUserCommentData', () {
      expect(
        createSubject(),
        isA<AppCurrentUserCommentData>(),
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
  });
}
