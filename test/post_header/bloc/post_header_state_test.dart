import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_header/post_header.dart';

void main() {
  const id = 'id';
  final visitedPosts = {id};

  group(PostHeaderState, () {
    PostHeaderState createSubject({
      required Set<String> visitedPosts,
    }) {
      return PostHeaderState(
        id: id,
        visitedPosts: visitedPosts,
        header: PostHeaderModelPlaceholder(),
      );
    }

    group('initial', () {
      test('returns $PostHeaderState', () {
        expect(
          PostHeaderState.initial(
            id: id,
            visitedPosts: visitedPosts,
          ),
          PostHeaderState(
            id: id,
            visitedPosts: visitedPosts,
            header: PostHeaderModelPlaceholder(),
          ),
        );
      });
    });

    group('visited', () {
      test('returns true when visitedPosts contains id', () {
        final state = createSubject(
          visitedPosts: visitedPosts,
        );
        expect(state.visited, true);
      });

      test('returns false when visitedPosts does not contain id', () {
        final state = createSubject(
          visitedPosts: {},
        );
        expect(state.visited, false);
      });
    });
  });
}
