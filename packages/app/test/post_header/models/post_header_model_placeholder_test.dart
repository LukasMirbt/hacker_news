import 'package:app/post_header/post_header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PostHeaderModelPlaceholder, () {
    group('constructor', () {
      test('returns $PostHeaderModel', () {
        expect(
          PostHeaderModelPlaceholder(),
          isA<PostHeaderModel>(),
        );
      });
    });
  });
}
