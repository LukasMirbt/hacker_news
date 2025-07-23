// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(DetailCommentFormDataPlaceholder, () {
    test('returns $DetailCommentFormData', () {
      expect(
        DetailCommentFormDataPlaceholder(),
        isA<DetailCommentFormData>(),
      );
    });
  });
}
