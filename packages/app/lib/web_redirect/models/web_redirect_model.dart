import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebRedirectModel extends Equatable {
  const WebRedirectModel({
    required WebRedirect redirect,
    required this.initialData,
    required this.initialUrlRequest,
  }) : _redirect = redirect;

  factory WebRedirectModel.from(WebRedirect redirect) {
    switch (redirect) {
      case UrlRedirect():
        return WebRedirectModel(
          redirect: redirect,
          initialData: null,
          initialUrlRequest: URLRequest(
            url: WebUri.uri(redirect.url),
          ),
        );
      case HtmlRedirect():
        return WebRedirectModel(
          redirect: redirect,
          initialUrlRequest: null,
          initialData: InAppWebViewInitialData(
            baseUrl: WebUri.uri(redirect.baseUrl),
            data: redirect.html,
          ),
        );
    }
  }

  final WebRedirect _redirect;
  final InAppWebViewInitialData? initialData;
  final URLRequest? initialUrlRequest;

  Uri get url => switch (_redirect) {
    UrlRedirect() => _redirect.url,
    HtmlRedirect() => _redirect.baseUrl,
  };

  @override
  List<Object?> get props => [
    _redirect,
    initialUrlRequest,
    initialData,
  ];
}
