import 'package:app/app_web_view/app_web_view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockInAppWebViewInitialData extends Mock
    implements InAppWebViewInitialData {}

class _MockURLRequest extends Mock implements URLRequest {}

void main() {
  final url = Uri.parse('https://example.com');
  const html = 'html';
  final redirect = AppWebViewPlaceholder();

  group(AppWebViewModel, () {
    late InAppWebViewInitialData initialData;
    late URLRequest initialUrlRequest;

    setUp(() {
      initialData = _MockInAppWebViewInitialData();
      initialUrlRequest = _MockURLRequest();
    });

    AppWebViewModel createSubject() {
      return AppWebViewModel(
        redirect: redirect,
        initialUrlRequest: initialUrlRequest,
        initialData: initialData,
      );
    }

    group('from', () {
      test('returns $AppWebViewModel with initialData '
          'when html is non-null', () {
        final redirect = AppWebView(
          url: url,
          html: html,
        );
        expect(
          AppWebViewModel.from(redirect),
          isA<AppWebViewModel>()
              .having(
                (model) => model.initialData,
                'initialData',
                isA<InAppWebViewInitialData>()
                    .having(
                      (data) => data.baseUrl,
                      'baseUrl',
                      WebUri.uri(redirect.url),
                    )
                    .having(
                      (data) => data.data,
                      'data',
                      html,
                    ),
              )
              .having(
                (model) => model.initialUrlRequest,
                'initialUrlRequest',
                null,
              ),
        );
      });

      test('returns $AppWebViewModel with initialUrlRequest '
          'when html is null', () {
        final redirect = AppWebView(url: url);
        expect(
          AppWebViewModel.from(redirect),
          isA<AppWebViewModel>()
              .having(
                (model) => model.initialUrlRequest,
                'initialUrlRequest',
                isA<URLRequest>().having(
                  (request) => request.url,
                  'url',
                  WebUri.uri(redirect.url),
                ),
              )
              .having(
                (model) => model.initialData,
                'initialData',
                null,
              ),
        );
      });
    });

    group('initialData', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.initialData, initialData);
      });
    });

    group('initialUrlRequest', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.initialUrlRequest, initialUrlRequest);
      });
    });

    group('url', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.url, redirect.url);
      });
    });
  });
}
