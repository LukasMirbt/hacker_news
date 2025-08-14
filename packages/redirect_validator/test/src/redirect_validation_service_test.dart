// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:redirect_validator/redirect_validator.dart';

class _MockRedirectValidationModel extends Mock
    implements RedirectValidationModel {}

class _MockResponse extends Mock implements Response<dynamic> {}

class _MockHeaders extends Mock implements Headers {}

class _MockRequestOptions extends Mock implements RequestOptions {}

void main() {
  group(RedirectValidationService, () {
    late RedirectValidationModel model;
    late Response<dynamic> response;
    late Headers headers;
    late RequestOptions options;

    setUp(() {
      model = _MockRedirectValidationModel();
      response = _MockResponse();
      headers = _MockHeaders();
      options = _MockRequestOptions();
      when(() => response.headers).thenReturn(headers);
      when(() => response.requestOptions).thenReturn(options);
    });

    RedirectValidationService createSubject() {
      return RedirectValidationService(model: model);
    }

    group('shouldValidate', () {
      final shouldValidate = () => model.shouldValidate(options);

      test('returns model.shouldValidate', () {
        const value = true;
        when(shouldValidate).thenReturn(value);
        final service = createSubject();
        expect(service.shouldValidate(options), value);
      });
    });

    group('validateRedirect', () {
      final gotoUri = Uri.parse('item?id=id');
      final redirectUri = Uri.parse('news');

      final parseGoto = () => model.parseGoto(options);
      final parseRedirect = () => model.parseRedirect(headers);

      final isMatch = () => model.isMatch(
        gotoUri: gotoUri,
        redirectUri: redirectUri,
      );

      test('throws $ValidationException when statusCode '
          'is not ${HttpStatus.found}', () {
        when(() => response.statusCode).thenReturn(HttpStatus.ok);
        final service = createSubject();
        expect(
          () => service.validateRedirect(response),
          throwsA(
            ValidationException(),
          ),
        );
      });

      test('throws $ValidationException when gotoUri is null', () {
        when(() => response.statusCode).thenReturn(HttpStatus.found);
        final service = createSubject();
        expect(
          () => service.validateRedirect(response),
          throwsA(
            ValidationException(),
          ),
        );
        verify(parseGoto).called(1);
      });

      test('throws $ValidationException when redirectUri is null', () {
        when(() => response.statusCode).thenReturn(HttpStatus.found);
        when(parseGoto).thenReturn(gotoUri);
        final service = createSubject();
        expect(
          () => service.validateRedirect(response),
          throwsA(
            ValidationException(),
          ),
        );
        verify(parseGoto).called(1);
        verify(parseRedirect).called(1);
      });

      test('throws $UnexpectedRedirectException when gotoUri '
          'does not match redirectUri', () {
        when(() => response.statusCode).thenReturn(HttpStatus.found);
        when(parseGoto).thenReturn(gotoUri);
        when(parseRedirect).thenReturn(redirectUri);
        when(isMatch).thenReturn(false);
        final service = createSubject();
        expect(
          () => service.validateRedirect(response),
          throwsA(
            UnexpectedRedirectException(redirectUri),
          ),
        );
        verify(parseGoto).called(1);
        verify(parseRedirect).called(1);
        verify(isMatch).called(1);
      });

      test('returns when gotoUri matches redirectUri', () {
        when(() => response.statusCode).thenReturn(HttpStatus.found);
        when(parseGoto).thenReturn(gotoUri);
        when(parseRedirect).thenReturn(redirectUri);
        when(isMatch).thenReturn(true);
        final service = createSubject();
        service.validateRedirect(response);
        verify(parseGoto).called(1);
        verify(parseRedirect).called(1);
        verify(isMatch).called(1);
      });
    });
  });
}
