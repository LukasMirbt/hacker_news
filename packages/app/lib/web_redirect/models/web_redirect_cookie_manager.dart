import 'dart:io' as io;

import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;

class WebRedirectCookieManager {
  const WebRedirectCookieManager({
    required CookieManager cookieManager,
    required WebRedirectCookieAdapter cookieAdapter,
  }) : _cookieManager = cookieManager,
       _adapter = cookieAdapter;

  final CookieManager _cookieManager;
  final WebRedirectCookieAdapter _adapter;

  Future<void> setCookies({
    required Uri url,
    required List<io.Cookie> cookies,
  }) async {
    for (final cookie in cookies) {
      await _adapter.setCookie(
        url: url,
        cookie: cookie,
      );
    }
  }

  Future<List<io.Cookie>> cookies(Uri url) async {
    final webViewCookies = await _cookieManager.getCookies(
      url: WebUri.uri(url),
    );

    final ioCookies = [
      for (final cookie in webViewCookies) _adapter.convert(cookie),
    ];

    return ioCookies;
  }
}
