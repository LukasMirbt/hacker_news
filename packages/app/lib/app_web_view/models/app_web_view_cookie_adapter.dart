import 'dart:io' as io;

import 'package:flutter_inappwebview/flutter_inappwebview.dart' as web_view;

class AppWebViewCookieAdapter {
  const AppWebViewCookieAdapter({
    required web_view.CookieManager cookieManager,
  }) : _cookieManager = cookieManager;

  final web_view.CookieManager _cookieManager;

  Future<void> setCookie({
    required Uri url,
    required io.Cookie cookie,
  }) async {
    await _cookieManager.setCookie(
      url: web_view.WebUri.uri(url),
      name: cookie.name,
      value: cookie.value,
      path: cookie.path ?? '/',
      domain: cookie.domain,
      expiresDate: cookie.expires?.millisecondsSinceEpoch,
      isSecure: cookie.secure,
      isHttpOnly: cookie.httpOnly,
      sameSite: switch (cookie.sameSite) {
        io.SameSite.lax => web_view.HTTPCookieSameSitePolicy.LAX,
        io.SameSite.strict => web_view.HTTPCookieSameSitePolicy.STRICT,
        io.SameSite.none => web_view.HTTPCookieSameSitePolicy.NONE,
        _ => null,
      },
    );
  }

  io.Cookie convert(web_view.Cookie cookie) {
    final name = cookie.name;
    final value = cookie.value.toString();

    final ioCookie = io.Cookie(name, value);
    final expiresDate = cookie.expiresDate;

    final expires = expiresDate != null
        ? DateTime.fromMillisecondsSinceEpoch(expiresDate)
        : null;

    final domain = cookie.domain;
    final path = cookie.path;
    final secure = cookie.isSecure ?? ioCookie.secure;
    final httpOnly = cookie.isHttpOnly ?? ioCookie.httpOnly;

    final sameSite = switch (cookie.sameSite) {
      web_view.HTTPCookieSameSitePolicy.LAX => io.SameSite.lax,
      web_view.HTTPCookieSameSitePolicy.STRICT => io.SameSite.strict,
      web_view.HTTPCookieSameSitePolicy.NONE => io.SameSite.none,
      _ => null,
    };

    ioCookie
      ..expires = expires
      ..domain = domain
      ..path = path
      ..secure = secure
      ..httpOnly = httpOnly
      ..sameSite = sameSite;

    return ioCookie;
  }
}
