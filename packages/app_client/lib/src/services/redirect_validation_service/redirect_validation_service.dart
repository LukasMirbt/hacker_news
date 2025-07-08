import 'dart:io';

import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';

export 'redirect_validation_model.dart';
export 'redirect_validation_options.dart';

class ValidationException with EquatableMixin implements Exception {
  const ValidationException();

  @override
  List<Object> get props => [];
}

class UnexpectedRedirectException extends ValidationException {
  const UnexpectedRedirectException(this.url);

  final Uri url;

  @override
  List<Object> get props => [url];
}

class RedirectValidationService {
  const RedirectValidationService({
    RedirectValidationModel? model,
  }) : _model = model ?? const RedirectValidationModel();

  final RedirectValidationModel _model;

  bool shouldValidate(RequestOptions options) {
    return _model.shouldValidate(options);
  }

  void validateRedirect(Response<dynamic> response) {
    final statusCode = response.statusCode;
    if (statusCode != HttpStatus.found) throw const ValidationException();

    final options = response.requestOptions;
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
