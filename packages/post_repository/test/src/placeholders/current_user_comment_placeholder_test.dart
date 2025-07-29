import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(CurrentUserCommentPlaceholder, () {
    test('returns $CurrentUserComment', () {
      expect(
        CurrentUserCommentPlaceholder(),
        isA<CurrentUserComment>(),
      );
    });
  });
}
