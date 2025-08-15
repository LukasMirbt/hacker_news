import 'dart:io';

import 'package:collection/collection.dart';
import 'package:redirect_validator/redirect_validator.dart';

class RedirectValidationModel {
  const RedirectValidationModel();

  bool shouldValidate(RequestOptions options) =>
      options.extra[RedirectValidationOptions.extraKey] == true;

  Uri? parseRedirect(Headers headers) {
    final values = headers[HttpHeaders.locationHeader];
    if (values == null) return null;
    final redirect = values.singleOrNull;
    if (redirect == null) return null;
    return Uri.tryParse(redirect);
  }

  Uri? parseGoto(RequestOptions options) {
    String? goto;

    switch (options) {
      case RequestOptions(
        method: 'GET',
        uri: Uri(
          queryParameters: {
            'goto': final String value,
          },
        ),
      ):
        goto = value;
      case RequestOptions(
        method: 'POST',
        data: {
          'goto': final String value,
        },
      ):
        goto = value;
    }

    if (goto == null) return null;

    return Uri.tryParse(goto);
  }

  bool isMatch({
    required Uri gotoUri,
    required Uri redirectUri,
  }) {
    final listEquals = const ListEquality<String>().equals;
    final mapEquals = const MapEquality<String, String>().equals;
    return listEquals(
          gotoUri.pathSegments,
          redirectUri.pathSegments,
        ) &&
        mapEquals(
          gotoUri.queryParameters,
          redirectUri.queryParameters,
        );
  }
}
