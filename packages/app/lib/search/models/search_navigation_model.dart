import 'package:web_links/web_links.dart';

enum SearchNavigationDecision {
  post,
  externalLink,
  navigate,
}

class SearchNavigationModel {
  const SearchNavigationModel({
    WebLinks? webLinks,
  }) : _links = webLinks ?? const WebLinks();

  final WebLinks _links;

  Uri get initialUrl => _links.searchUrl;

  SearchNavigationDecision navigate(Uri url) {
    final isPost = _links.isPost(url);
    if (isPost) return SearchNavigationDecision.post;

    final isHackerNews = _links.isHackerNews(url);
    if (isHackerNews) return SearchNavigationDecision.navigate;

    final isSearch = _links.isSearch(url);
    if (isSearch) return SearchNavigationDecision.navigate;

    return SearchNavigationDecision.externalLink;
  }
}
