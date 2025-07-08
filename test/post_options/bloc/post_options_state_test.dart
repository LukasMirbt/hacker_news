import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(PostOptionsState, () {
    group('from', () {
      test('returns $PostOptionsState', () {
        final post = PostPlaceholder();
        expect(
          PostOptionsState.from(post),
          PostOptionsState(
            post: PostModel(post),
          ),
        );
      });
    });
  });
}
