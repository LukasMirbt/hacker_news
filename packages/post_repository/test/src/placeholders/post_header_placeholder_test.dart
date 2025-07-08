import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(PostHeaderPlaceholder, () {
    test('returns $PostHeader', () {
      expect(
        PostHeaderPlaceholder(),
        isA<PostHeader>(),
      );
    });
  });
}
