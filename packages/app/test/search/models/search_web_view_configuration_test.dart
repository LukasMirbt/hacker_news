import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/search/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  final searchUrl = Uri.parse('https://www.example.com/search');

  group(SearchWebViewConfiguration, () {
    late WebLinks links;

    setUp(() {
      links = _MockWebLinks();
      when(() => links.searchUrl).thenReturn(searchUrl);
    });

    SearchWebViewConfiguration createSubject() {
      return SearchWebViewConfiguration(links: links);
    }

    group('initialUrl', () {
      test('returns links.searchUrl', () {
        final configuration = createSubject();
        expect(configuration.initialUrl, searchUrl);
      });
    });

    group('onNavigationRequest', () {
      final url = Uri.parse('https://www.example.com');

      test('returns ${NavigationDecision.prevent} '
          'when isPost', () {
        when(() => links.isPost(url)).thenReturn(true);
        final configuration = createSubject();
        expect(
          configuration.onNavigationRequest?.call(url),
          NavigationDecision.prevent,
        );
      });

      test('returns ${NavigationDecision.navigate} '
          'when !isPost and isHackerNews', () {
        when(() => links.isPost(url)).thenReturn(false);
        when(() => links.isHackerNews(url)).thenReturn(true);
        final configuration = createSubject();
        expect(
          configuration.onNavigationRequest?.call(url),
          NavigationDecision.navigate,
        );
      });

      test('returns ${NavigationDecision.navigate} '
          'when !isPost, !isHackerNews and isSearch', () {
        when(() => links.isPost(url)).thenReturn(false);
        when(() => links.isHackerNews(url)).thenReturn(false);
        when(() => links.isSearch(url)).thenReturn(true);
        final configuration = createSubject();
        expect(
          configuration.onNavigationRequest?.call(url),
          NavigationDecision.navigate,
        );
      });

      test('returns ${NavigationDecision.prevent} '
          'when !isPost, !isHackerNews and !isSearch', () {
        when(() => links.isPost(url)).thenReturn(false);
        when(() => links.isHackerNews(url)).thenReturn(false);
        when(() => links.isSearch(url)).thenReturn(false);
        final configuration = createSubject();
        expect(
          configuration.onNavigationRequest?.call(url),
          NavigationDecision.prevent,
        );
      });
    });
  });
}
