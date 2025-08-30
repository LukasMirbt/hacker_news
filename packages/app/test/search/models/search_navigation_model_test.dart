import 'package:app/search/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  group(SearchNavigationModel, () {
    late WebLinks links;

    setUp(() {
      links = _MockWebLinks();
    });

    SearchNavigationModel createSubject() {
      return SearchNavigationModel(webLinks: links);
    }

    group('initialUrl', () {
      test('returns links.searchUrl', () {
        final searchUrl = Uri.parse('https://www.example.com/search');
        when(() => links.searchUrl).thenReturn(searchUrl);
        final model = createSubject();
        expect(model.initialUrl, searchUrl);
      });
    });

    group('navigate', () {
      final url = Uri.parse('https://www.example.com');

      test('returns ${SearchNavigationDecision.post} '
          'when isPost', () {
        when(() => links.isPost(url)).thenReturn(true);
        final model = createSubject();
        expect(
          model.navigate(url),
          SearchNavigationDecision.post,
        );
      });

      test('returns ${SearchNavigationDecision.navigate} '
          'when !isPost and isHackerNews', () {
        when(() => links.isPost(url)).thenReturn(false);
        when(() => links.isHackerNews(url)).thenReturn(true);
        final model = createSubject();
        expect(
          model.navigate(url),
          SearchNavigationDecision.navigate,
        );
      });

      test('returns ${SearchNavigationDecision.navigate} '
          'when !isPost, !isHackerNews and isSearch', () {
        when(() => links.isPost(url)).thenReturn(false);
        when(() => links.isHackerNews(url)).thenReturn(false);
        when(() => links.isSearch(url)).thenReturn(true);
        final model = createSubject();
        expect(
          model.navigate(url),
          SearchNavigationDecision.navigate,
        );
      });

      test('returns ${SearchNavigationDecision.externalLink} '
          'when !isPost, !isHackerNews and !isSearch', () {
        when(() => links.isPost(url)).thenReturn(false);
        when(() => links.isHackerNews(url)).thenReturn(false);
        when(() => links.isSearch(url)).thenReturn(false);
        final model = createSubject();
        expect(
          model.navigate(url),
          SearchNavigationDecision.externalLink,
        );
      });
    });
  });
}
