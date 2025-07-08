import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(PostData, () {
    group('empty', () {
      test('returns $PostData', () {
        expect(
          PostData.empty,
          isA<PostData>(),
        );
      });
    });
  });
}
