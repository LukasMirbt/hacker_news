import 'package:flutter/material.dart';

class WebLinks {
  const WebLinks();

  @visibleForTesting
  static Uri baseUrl = Uri(
    scheme: 'https',
    host: 'news.ycombinator.com',
  );

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

  Uri searchUrl(String search) {
    return Uri(
      scheme: 'https',
      host: 'hn.algolia.com',
      path: '/',
      queryParameters: {'q': search},
    );
  }
}
