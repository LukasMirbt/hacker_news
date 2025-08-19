import 'dart:async';

import 'package:app_client/app_client.dart';

class WebRedirectException extends DioException {
  WebRedirectException({
    required super.error,
    required super.requestOptions,
  });
}

class WebRedirectInterceptor extends Interceptor {
  WebRedirectInterceptor({
    RedirectValidator? redirectValidator,
  }) : _validator = redirectValidator ?? const RedirectValidator();

  final RedirectValidator _validator;
  final _controller = StreamController<WebRedirect>.broadcast();

  Stream<WebRedirect> get redirect => _controller.stream;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final shouldValidate = _validator.shouldValidate(options);

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
    final shouldValidate = _validator.shouldValidate(options);

    if (!shouldValidate) {
      handler.next(response);
      return;
    }

    try {
      _validator.validateRedirect(response);
      handler.next(response);
    } on ValidationException catch (error) {
      if (error is MissingRedirectException) {
        _controller.add(
          WebRedirect(
            url: error.requestUrl,
            html: error.responseHtml,
          ),
        );
      } else if (error is UnexpectedRedirectException) {
        _controller.add(
          WebRedirect(url: error.redirectUrl),
        );
      }

      handler.reject(
        WebRedirectException(
          error: error,
          requestOptions: options,
        ),
      );
    }
  }
}
