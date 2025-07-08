import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(PostDataPlaceholder, () {
    test('returns $PostData', () {
      expect(
        PostDataPlaceholder(),
        isA<PostData>(),
      );
    });
  });
}
