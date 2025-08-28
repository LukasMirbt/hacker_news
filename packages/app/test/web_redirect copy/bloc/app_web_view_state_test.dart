// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppWebViewState, () {
    group('from', () {
      test('returns $AppWebViewState', () {
        final configuration = AppWebViewConfiguration.from(
          initialUrl: Uri.parse('https://www.example.com'),
        );

        final onNavigationRequest = (_) => NavigationDecision.navigate;

        expect(
          AppWebViewState.from(
            configuration: configuration,
            onNavigationRequest: onNavigationRequest,
          ),
          isA<AppWebViewState>()
              .having(
                (state) => state.configuration,
                'configuration',
                configuration,
              )
              .having(
                (state) => state.onNavigationRequest,
                'onNavigationRequest',
                onNavigationRequest,
              ),
        );
      });
    });
  });
}
