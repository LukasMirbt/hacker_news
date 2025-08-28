import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialUrl = Uri.parse('https://example.com');
  const initialHtml = 'html';

  group(AppWebViewConfiguration, () {
    group('from', () {
      test('returns $AppWebViewConfiguration with initialData '
          'when html is non-null', () {
        expect(
          AppWebViewConfiguration.from(
            initialUrl: initialUrl,
            initialHtml: initialHtml,
          ),
          isA<AppWebViewConfiguration>()
              .having(
                (model) => model.initialData,
                'initialData',
                isA<InAppWebViewInitialData>()
                    .having(
                      (data) => data.baseUrl,
                      'baseUrl',
                      WebUri.uri(initialUrl),
                    )
                    .having(
                      (data) => data.data,
                      'data',
                      initialHtml,
                    ),
              )
              .having(
                (model) => model.initialUrlRequest,
                'initialUrlRequest',
                null,
              ),
        );
      });

      test('returns $AppWebViewConfiguration with initialUrlRequest '
          'when html is null', () {
        expect(
          AppWebViewConfiguration.from(
            initialUrl: initialUrl,
          ),
          isA<AppWebViewConfiguration>()
              .having(
                (model) => model.initialUrlRequest,
                'initialUrlRequest',
                isA<URLRequest>().having(
                  (request) => request.url,
                  'url',
                  WebUri.uri(initialUrl),
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
  });
}
