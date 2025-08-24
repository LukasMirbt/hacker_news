import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_links/web_links.dart';

part 'web_redirect.g.dart';

sealed class WebRedirect {}

@JsonSerializable()
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

  factory UrlRedirect.fromJson(Map<String, dynamic> json) =>
      _$UrlRedirectFromJson(json);

  static final empty = UrlRedirect(Uri());

  final Uri url;

  Map<String, dynamic> toJson() => _$UrlRedirectToJson(this);
}

@JsonSerializable()
class HtmlRedirect extends WebRedirect {
  HtmlRedirect({
    required this.baseUrl,
    required this.html,
  });

  factory HtmlRedirect.fromJson(Map<String, dynamic> json) =>
      _$HtmlRedirectFromJson(json);

  final Uri baseUrl;
  final String html;

  Map<String, dynamic> toJson() => _$HtmlRedirectToJson(this);
}
