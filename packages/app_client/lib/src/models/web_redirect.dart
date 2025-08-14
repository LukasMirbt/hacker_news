import 'package:web_links/web_links.dart';

class WebRedirect {
  WebRedirect({
    required Uri url,
    this.html,
    WebLinks webLinks = const WebLinks(),
  }) : url = webLinks.resolve(
         url.toString(),
       );

  factory WebRedirect.from(
    String urlString, {
    String? html,
  }) {
    return WebRedirect(
      url: Uri.parse(urlString),
      html: html,
    );
  }

  static final empty = WebRedirect(url: Uri());

  final Uri url;
  final String? html;

  String get urlString => url.toString();
}
