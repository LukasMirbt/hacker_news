// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(RedirectValidationModel, () {
    RedirectValidationModel createSubject() => RedirectValidationModel();

    group('shouldValidate', () {
      test('returns true when ${RedirectValidationOptions.extraKey} '
          'is true', () {
        final options = RequestOptions(
          extra: {RedirectValidationOptions.extraKey: true},
        );
        final service = createSubject();
        expect(service.shouldValidate(options), true);
      });

      test('returns false when ${RedirectValidationOptions.extraKey} '
          'is false', () {
        final options = RequestOptions(
          extra: {RedirectValidationOptions.extraKey: false},
        );
        final service = createSubject();
        expect(service.shouldValidate(options), false);
      });

      test('returns false when ${RedirectValidationOptions.extraKey} '
          'is not set', () {
        final options = RequestOptions(extra: {});
        final service = createSubject();
        expect(service.shouldValidate(options), false);
      });
    });

    group('parseRedirect', () {
      test('returns null when location header is null', () {
        final headers = Headers();
        final model = createSubject();
        expect(model.parseRedirect(headers), null);
      });

      test('returns null when location header has multiple values', () {
        final headers = Headers.fromMap({
          HttpHeaders.locationHeader: ['first', 'second'],
        });
        final model = createSubject();
        expect(model.parseRedirect(headers), null);
      });

      test('returns null when location header is invalid', () {
        const location = ':location';
        final headers = Headers.fromMap({
          HttpHeaders.locationHeader: [location],
        });
        final model = createSubject();
        expect(model.parseRedirect(headers), null);
      });

      test('returns $Uri when location header is valid', () {
        const location = 'https://example.com/';
        final headers = Headers.fromMap({
          HttpHeaders.locationHeader: [location],
        });
        final model = createSubject();
        expect(
          model.parseRedirect(headers),
          Uri.parse(location),
        );
      });
    });

    group('parseGoto', () {
      test('returns $Uri when options match GET pattern', () {
        const goto = 'news?p=1';

        final uri = Uri(
          path: 'vote',
          queryParameters: {
            'id': 'id',
            'goto': goto,
          },
        );

        final path = uri.toString();

        final options = RequestOptions(
          method: 'GET',
          path: path,
        );

        final model = createSubject();

        expect(
          model.parseGoto(options),
          Uri.parse(goto),
        );
      });

      test('returns $Uri when options match POST pattern', () {
        const value = 'https://example.com/';

        final options = RequestOptions(
          method: 'POST',
          data: {
            'key': 'value',
            'goto': value,
          },
        );

        final model = createSubject();

        expect(
          model.parseGoto(options),
          Uri.parse(value),
        );
      });

      test('returns null when options match no pattern', () {
        final options = RequestOptions();
        final model = createSubject();
        expect(model.parseGoto(options), null);
      });

      test('returns null when options match a pattern '
          'and value is invalid', () {
        const value = ':value';

        final options = RequestOptions(
          method: 'POST',
          data: {'goto': value},
        );

        final model = createSubject();

        expect(
          model.parseGoto(options),
          null,
        );
      });
    });

    group('isMatch', () {
      test('returns true when pathSegments and queryParameters match', () {
        final gotoUri = Uri(
          path: 'item',
          queryParameters: {'id': 'id'},
        );
        final redirectUri = Uri(
          path: '/item',
          queryParameters: {'id': 'id'},
        );
        final model = createSubject();
        final isMatch = model.isMatch(
          gotoUri: gotoUri,
          redirectUri: redirectUri,
        );
        expect(isMatch, true);
      });

      test('returns false when pathSegments and queryParameters '
          'do not match', () {
        final gotoUri = Uri(
          path: 'news',
        );
        final redirectUri = Uri(
          path: '/item',
          queryParameters: {'id': 'id'},
        );
        final model = createSubject();
        final isMatch = model.isMatch(
          gotoUri: gotoUri,
          redirectUri: redirectUri,
        );
        expect(isMatch, false);
      });
    });
  });
}
