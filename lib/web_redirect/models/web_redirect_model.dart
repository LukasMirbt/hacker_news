import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebRedirectModel extends Equatable {
  WebRedirectModel({
    required WebRedirect redirect,
  }) : _redirect = redirect,
       initialUrlRequest = URLRequest(
         url: WebUri.uri(redirect.url),
       ),
       initialData = redirect.html != null
           ? InAppWebViewInitialData(
               baseUrl: WebUri.uri(redirect.url),
               data: redirect.html!,
             )
           : null;

  final WebRedirect _redirect;
  final URLRequest initialUrlRequest;
  final InAppWebViewInitialData? initialData;

  Uri get url => _redirect.url;

  @override
  List<Object> get props => [_redirect];
}
