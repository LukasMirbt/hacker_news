import 'package:app_client/app_client.dart' hide AuthenticationStatus;

class RedirectInterceptor extends Interceptor {
  const RedirectInterceptor({
    required RedirectService redirectService,
  }) : _service = redirectService;

  final RedirectService _service;

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
      _service.redirectToLogin();
    }

    handler.next(response);
  }
}
