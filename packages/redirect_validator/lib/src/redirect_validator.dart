import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:redirect_validator/redirect_validator.dart';

class ValidationException with EquatableMixin implements Exception {
  const ValidationException();

  @override
  List<Object> get props => [];
}

class MissingRedirectException extends ValidationException {
  const MissingRedirectException({
    required this.requestUrl,
    required this.responseHtml,
  });

  final Uri requestUrl;
  final String responseHtml;

  @override
  List<Object> get props => [
    requestUrl,
    responseHtml,
  ];
}

class UnexpectedRedirectException extends ValidationException {
  const UnexpectedRedirectException(this.redirectUrl);

  final Uri redirectUrl;

  @override
  List<Object> get props => [redirectUrl];
}

class RedirectValidator {
  const RedirectValidator({
    RedirectValidationModel? model,
  }) : _model = model ?? const RedirectValidationModel();

  final RedirectValidationModel _model;

  bool shouldValidate(RequestOptions options) {
    return _model.shouldValidate(options);
  }

  void validateRedirect(Response<dynamic> response) {
    final statusCode = response.statusCode;
    final options = response.requestOptions;
    final data = response.data;

    if (statusCode == HttpStatus.ok && data is String) {
      throw MissingRedirectException(
        requestUrl: options.uri,
        responseHtml: data,
      );
    }

    if (statusCode != HttpStatus.found) {
      throw const ValidationException();
    }

    final gotoUri = _model.parseGoto(options);
    if (gotoUri == null) throw const ValidationException();

    final headers = response.headers;
    final redirectUri = _model.parseRedirect(headers);
    if (redirectUri == null) throw const ValidationException();

    final isRedirectSameAsGoto = _model.isMatch(
      gotoUri: gotoUri,
      redirectUri: redirectUri,
    );

    if (!isRedirectSameAsGoto) {
      throw UnexpectedRedirectException(redirectUri);
    }
  }
}
