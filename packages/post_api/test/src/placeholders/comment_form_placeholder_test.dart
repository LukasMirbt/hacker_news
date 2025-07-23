import 'package:flutter_test/flutter_test.dart';
import 'package:post_api/post_api.dart';

void main() {
  group(CommentFormPlaceholder, () {
    test('returns $CommentForm', () {
      expect(
        CommentFormPlaceholder(),
        isA<CommentForm>(),
      );
    });
  });
}
