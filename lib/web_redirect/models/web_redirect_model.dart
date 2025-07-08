import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebRedirectModel extends Equatable {
  WebRedirectModel({
    required WebRedirect redirect,
  }) : _redirect = redirect,
       initialUrlRequest = URLRequest(
         url: WebUri.uri(redirect.url),
       );

  final WebRedirect _redirect;
  final URLRequest initialUrlRequest;

  Uri get url => _redirect.url;

  @override
  List<Object> get props => [_redirect];
}
