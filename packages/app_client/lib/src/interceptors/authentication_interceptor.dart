import 'package:app_client/app_client.dart' hide AuthenticationStatus;

class AuthenticationInterceptor extends Interceptor {
  const AuthenticationInterceptor({
    required AuthenticationService authenticationService,
  }) : _service = authenticationService;

  final AuthenticationService _service;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;

    if (data is String) {
      _service.update(data);
    }

    handler.next(response);
  }
}
