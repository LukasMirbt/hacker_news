import 'package:app_client/app_client.dart' hide AuthenticationStatus;

class LoginRedirectInterceptor extends Interceptor {
  const LoginRedirectInterceptor({
    required LoginRedirectService loginRedirectService,
  }) : _service = loginRedirectService;

  final LoginRedirectService _service;

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

    final shouldRedirect = _service.shouldRedirect(data);

    if (shouldRedirect) {
      _service.redirect();
    }

    handler.next(response);
  }
}
