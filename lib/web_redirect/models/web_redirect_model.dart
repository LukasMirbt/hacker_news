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
    final html = redirect.html;

    if (html != null) {
      return WebRedirectModel(
        redirect: redirect,
        initialUrlRequest: null,
        initialData: InAppWebViewInitialData(
          baseUrl: WebUri.uri(redirect.url),
          data: html,
        ),
      );
    } else {
      return WebRedirectModel(
        redirect: redirect,
        initialData: null,
        initialUrlRequest: URLRequest(
          url: WebUri.uri(redirect.url),
        ),
      );
    }
  }

  final WebRedirect _redirect;
  final InAppWebViewInitialData? initialData;
  final URLRequest? initialUrlRequest;

  Uri get url => _redirect.url;

  @override
  List<Object?> get props => [
    _redirect,
    initialUrlRequest,
    initialData,
  ];
}
