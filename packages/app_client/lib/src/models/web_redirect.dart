class WebRedirect {
  WebRedirect({
    required this.url,
    this.html,
  });

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
