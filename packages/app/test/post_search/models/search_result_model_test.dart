import 'package:app/post_search/post_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockOtherUserComment extends Mock implements OtherUserComment {}

class _MockSearchResultSnippet extends Mock implements SearchResultSnippet {}

class _MockSearchMatch extends Mock implements SearchMatch {}

void main() {
  group(SearchResultModel, () {
    late OtherUserComment comment;
    late SearchResultSnippet snippet;
    late SearchMatch match;

    setUp(() {
      comment = _MockOtherUserComment();
      snippet = _MockSearchResultSnippet();
      match = _MockSearchMatch();
    });

    SearchResultModel createSubject() {
      return SearchResultModel(
        comment: comment,
        snippet: snippet,
      );
    }

    group('id', () {
      test('returns comment.id', () {
        const id = 'id';
        when(() => comment.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('user', () {
      test('returns comment.hnuser.id', () {
        const hnuser = HnuserPlaceholder();
        when(() => comment.hnuser).thenReturn(hnuser);
        final model = createSubject();
        expect(model.user, hnuser.id);
      });
    });

    group('match', () {
      test('returns snippet.match', () {
        when(() => snippet.match).thenReturn(match);
        final model = createSubject();
        expect(model.match, match);
      });
    });

    group('toRepository', () {
      test('returns comment', () {
        final model = createSubject();
        expect(
          model.toRepository(),
          comment,
        );
      });
    });
  });
}
