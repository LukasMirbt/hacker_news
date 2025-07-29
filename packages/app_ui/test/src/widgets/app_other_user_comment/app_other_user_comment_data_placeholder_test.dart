import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppOtherUserCommentDataPlaceholder, () {
    AppOtherUserCommentDataPlaceholder createSubject() {
      return AppOtherUserCommentDataPlaceholder();
    }

    test('returns $AppOtherUserCommentData', () {
      expect(
        createSubject(),
        isA<AppOtherUserCommentData>(),
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
