import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_header/post_header.dart';

void main() {
  group(PostHeaderState, () {
    group('initial', () {
      test('returns $PostHeaderState', () {
        const id = 'id';
        expect(
          PostHeaderState.initial(id: id),
          PostHeaderState(
            id: id,
            header: PostHeaderModelPlaceholder(),
          ),
        );
      });
    });
  });
}
