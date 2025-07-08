import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_header/post_header.dart';

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
