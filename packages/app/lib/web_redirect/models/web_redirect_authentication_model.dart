import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';

class WebRedirectAuthenticationModel {
  const WebRedirectAuthenticationModel({
    required WebRedirectController controller,
    required WebRedirectCookieManager cookieManager,
    required AuthenticationRepository repository,
  }) : _controller = controller,
       _cookieManager = cookieManager,
       _repository = repository;

  final WebRedirectController _controller;
  final WebRedirectCookieManager _cookieManager;
  final AuthenticationRepository _repository;

  bool matchesAppHost(Uri? url) {
    if (url == null) return false;

    final baseUrl = _repository.state.baseUrl;
    return url.host == baseUrl.host;
  }

  Future<void> syncCookiesToWebView() async {
    final cookies = await _repository.cookies();

    await _cookieManager.setCookies(
      url: _repository.state.baseUrl,
      cookies: cookies,
    );
  }

  Future<void> syncCookiesToApp() async {
    final baseUrl = _repository.state.baseUrl;
    final cookies = await _cookieManager.cookies(baseUrl);
    await _repository.saveCookies(cookies);
  }

  Future<void> updateAuthenticationFromHtml() async {
    final html = await _controller.html();
    if (html == null) return;

    _repository.updateAuthenticationFromHtml(html);
  }
}
