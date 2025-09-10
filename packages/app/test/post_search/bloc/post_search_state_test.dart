import 'package:app/post_search/post_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(PostSearchState, () {
    group('initial', () {
      test('returns $PostSearchState', () {
        final comments = [OtherUserCommentPlaceholder()];
        const query = 'query';

        expect(
          PostSearchState.initial(
            comments: comments,
            query: query,
          ),
          PostSearchState(
            resultList: SearchResultListModel(
              comments: comments,
              query: query,
            ),
          ),
        );
      });
    });
  });
}
