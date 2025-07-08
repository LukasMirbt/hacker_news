import 'package:app_client/app_client.dart';

class RedirectException extends DioException {
  RedirectException({
    required super.error,
    required super.requestOptions,
  });
}

class RedirectValidationInterceptor extends Interceptor {
  const RedirectValidationInterceptor({
    required AppClient appClient,
    RedirectValidationService? redirectValidationService,
  }) : _client = appClient,
       _service =
           redirectValidationService ?? const RedirectValidationService();

  final AppClient _client;
  final RedirectValidationService _service;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final shouldValidate = _service.shouldValidate(options);

    if (shouldValidate) {
      options.followRedirects = false;
    }

    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    final options = response.requestOptions;
    final shouldValidate = _service.shouldValidate(options);

    if (!shouldValidate) {
      handler.next(response);
      return;
    }

    try {
      _service.validateRedirect(response);
      handler.next(response);
    } on ValidationException catch (error) {
      if (error is UnexpectedRedirectException) {
        await _client.redirectToWeb(error.url);
      }

      handler.reject(
        RedirectException(
          error: error,
          requestOptions: options,
        ),
      );
    }
  }
}
