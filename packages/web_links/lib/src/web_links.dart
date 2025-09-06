import 'package:flutter/material.dart';

class WebLinks {
  const WebLinks();

  @visibleForTesting
  static Uri baseUrl = Uri(
    scheme: 'https',
    host: 'news.ycombinator.com',
  );

  Uri get searchUrl {
    return Uri(
      scheme: 'https',
      host: 'hn.algolia.com',
      path: '/',
      queryParameters: {
        'dateRange': 'last24h',
      },
    );
  }

  bool isPost(Uri url) {
    return url.host == 'news.ycombinator.com' &&
        url.path == '/item' &&
        url.queryParameters.containsKey('id');
  }

  bool isHackerNews(Uri url) => url.host == 'news.ycombinator.com';

  bool isSearch(Uri url) => url.host == 'hn.algolia.com';

  Uri resolve(String urlString) {
    final url = Uri.parse(urlString);
    if (url.isAbsolute) return url;
    return baseUrl.resolveUri(url);
  }

  Uri commentUrl(String id) {
    return baseUrl.replace(
      path: 'item',
      queryParameters: {'id': id},
    );
  }

  Uri feedItemUrl(String id) {
    return baseUrl.replace(
      path: 'item',
      queryParameters: {'id': id},
    );
  }

  Uri postUrl(String id) {
    return baseUrl.replace(
      path: 'item',
      queryParameters: {'id': id},
    );
  }

  Uri profileUrl(String id) {
    return baseUrl.replace(
      path: 'user',
      queryParameters: {'id': id},
    );
  }
}
