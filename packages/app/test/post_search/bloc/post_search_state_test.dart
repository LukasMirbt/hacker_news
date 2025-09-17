import 'package:app/post_search/post_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(PostSearchState, () {
    group('initial', () {
      test('returns $PostSearchState', () {
        const status = FetchStatus.success;
        final comments = [OtherUserCommentPlaceholder()];
        const query = 'query';

        expect(
          PostSearchState.initial(
            status: status,
            comments: comments,
            query: query,
          ),
          PostSearchState(
            status: status,
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
