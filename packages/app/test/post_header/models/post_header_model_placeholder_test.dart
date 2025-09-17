import 'package:app/post_header/post_header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PostHeaderModelPlaceholder, () {
    PostHeaderModelPlaceholder createSubject() {
      return PostHeaderModelPlaceholder();
    }

    group('constructor', () {
      test('returns $PostHeaderModel', () {
        expect(
          createSubject(),
          isA<PostHeaderModel>(),
        );
      });
    });

    group('isPlaceholder', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.isPlaceholder, true);
      });
    });
  });
}
