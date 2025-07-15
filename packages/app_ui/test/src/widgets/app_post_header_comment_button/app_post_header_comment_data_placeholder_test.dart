import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppPostHeaderCommentButtonDataPlaceholder, () {
    AppPostHeaderCommentButtonDataPlaceholder createSubject() {
      return AppPostHeaderCommentButtonDataPlaceholder();
    }

    test('returns $AppPostHeaderCommentButtonData', () {
      expect(
        createSubject(),
        isA<AppPostHeaderCommentButtonData>(),
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
