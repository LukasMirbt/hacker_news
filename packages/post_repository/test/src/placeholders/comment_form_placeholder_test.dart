// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

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
