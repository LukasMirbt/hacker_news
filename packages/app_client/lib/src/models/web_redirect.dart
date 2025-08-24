import 'package:web_links/web_links.dart';

sealed class WebRedirect {}

class UrlRedirect extends WebRedirect {
  UrlRedirect(
    Uri url, {
    WebLinks webLinks = const WebLinks(),
  }) : url = webLinks.resolve(
         url.toString(),
       );

  factory UrlRedirect.from(String urlString) {
    return UrlRedirect(
      Uri.parse(urlString),
    );
  }

  static final empty = UrlRedirect(Uri());

  final Uri url;
}

class HtmlRedirect extends WebRedirect {
  HtmlRedirect({
    required this.baseUrl,
    required this.html,
  });

  final Uri baseUrl;
  final String html;
}
