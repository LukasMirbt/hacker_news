import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialUrl = Uri.parse('https://example.com');

  group(AppWebViewConfiguration, () {
    AppWebViewConfiguration createSubject({
      String? initialHtml,
    }) {
      return AppWebViewConfiguration(
        initialUrl: initialUrl,
        initialHtml: initialHtml,
        onNavigationRequest: (_) => NavigationDecision.navigate,
      );
    }

    group('initialData', () {
      test('returns null when initialHtml is null', () {
        final configuration = createSubject();
        expect(configuration.initialData(), null);
      });

      test('returns $InAppWebViewInitialData when initialHtml '
          'is non-null', () {
        const initialHtml = 'initialHtml';
        final configuration = createSubject(
          initialHtml: initialHtml,
        );
        expect(
          configuration.initialData(),
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
        );
      });
    });

    group('initialUrlRequest', () {
      test('returns null when initialHtml '
          'is non-null', () {
        final configuration = createSubject(
          initialHtml: 'initialHtml',
        );
        expect(
          configuration.initialUrlRequest(),
          null,
        );
      });

      test('returns $URLRequest when initial html '
          'is null', () {
        final configuration = createSubject();
        expect(
          configuration.initialUrlRequest(),
          isA<URLRequest>().having(
            (request) => request.url,
            'url',
            WebUri.uri(initialUrl),
          ),
        );
      });
    });
  });
}
