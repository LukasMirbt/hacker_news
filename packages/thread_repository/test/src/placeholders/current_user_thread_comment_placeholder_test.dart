import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(CurrentUserThreadCommentPlaceholder, () {
    test('returns $CurrentUserThreadComment', () {
      expect(
        CurrentUserThreadCommentPlaceholder(),
        isA<CurrentUserThreadComment>(),
      );
    });
  });
}
