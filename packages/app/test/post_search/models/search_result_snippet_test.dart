import 'package:app/post_search/post_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSearchMatch extends Mock implements SearchMatch {}

void main() {
  const text = 'text';

  group(SearchResultSnippet, () {
    SearchResultSnippet createSubject() {
      return SearchResultSnippet(
        text: text,
        match: _MockSearchMatch(),
      );
    }

    group('characters', () {
      test('returns correct characters', () {
        final model = createSubject();
        expect(
          model.characters,
          ['t', 'e', 'x', 't'],
        );
      });
    });
  });
}
