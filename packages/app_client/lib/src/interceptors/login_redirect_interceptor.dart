import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:authentication_parser/authentication_parser.dart';

class LoginRedirectInterceptor extends Interceptor {
  LoginRedirectInterceptor({
    IsLoginPageParser? isLoginPageParser,
  }) : _parser = isLoginPageParser ?? const IsLoginPageParser();

  final IsLoginPageParser _parser;

  final _controller = StreamController<LoginRedirect>.broadcast();
  Stream<LoginRedirect> get redirect => _controller.stream;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;

    if (data is! String) {
      handler.next(response);
      return;
    }

    final isLoginPage = _parser.parse(data);

    if (isLoginPage) {
      _controller.add(LoginRedirect());
    }

    handler.next(response);
  }
}
