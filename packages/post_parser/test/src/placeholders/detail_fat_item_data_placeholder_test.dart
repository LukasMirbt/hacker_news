import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(DetailFatItemDataPlaceholder, () {
    test('returns $DetailFatItemData', () {
      expect(
        DetailFatItemDataPlaceholder(),
        isA<DetailFatItemData>(),
      );
    });
  });
}
