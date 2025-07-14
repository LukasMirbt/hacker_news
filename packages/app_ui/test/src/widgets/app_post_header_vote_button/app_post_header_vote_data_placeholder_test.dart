import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppPostHeaderVoteButtonDataPlaceholder, () {
    AppPostHeaderVoteButtonDataPlaceholder createSubject() {
      return AppPostHeaderVoteButtonDataPlaceholder();
    }

    test('returns $AppPostHeaderVoteButtonData', () {
      expect(
        createSubject(),
        isA<AppPostHeaderVoteButtonData>(),
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
