// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockInAppWebViewController extends Mock
    implements InAppWebViewController {}

void main() {
  group(AppWebViewController, () {
    late InAppWebViewController controller;

    setUp(() {
      controller = _MockInAppWebViewController();
    });

    AppWebViewController createSubject() {
      return AppWebViewController()..initialize(controller);
    }

    group('canGoBack', () {
      final call = () => controller.canGoBack();
      const value = true;

      test('calls controller and returns correct value', () {
        when(call).thenAnswer((_) async => value);
        final model = createSubject();
        expect(
          model.canGoBack(),
          completion(value),
        );
        verify(call).called(1);
      });
    });

    group('canGoForward', () {
      final call = () => controller.canGoForward();
      const value = true;

      test('calls controller and returns correct value', () {
        when(call).thenAnswer((_) async => value);
        final model = createSubject();
        expect(
          model.canGoForward(),
          completion(value),
        );
        verify(call).called(1);
      });
    });

    group('goBack', () {
      final call = () => controller.goBack();

      test('calls controller', () {
        when(call).thenAnswer((_) async {});
        final model = createSubject();
        model.goBack();
        verify(call).called(1);
      });
    });

    group('goForward', () {
      final call = () => controller.goForward();

      test('calls controller', () {
        when(call).thenAnswer((_) async {});
        final model = createSubject();
        model.goForward();
        verify(call).called(1);
      });
    });

    group('reload', () {
      final call = () => controller.reload();

      test('calls controller', () {
        when(call).thenAnswer((_) async {});
        final model = createSubject();
        model.reload();
        verify(call).called(1);
      });
    });

    group('html', () {
      const html = 'html';
      final getHtml = () => controller.getHtml();

      test('calls controller and returns correct value', () {
        when(getHtml).thenAnswer((_) async => html);
        final model = createSubject();
        expect(
          model.html(),
          completion(html),
        );
        verify(getHtml).called(1);
      });
    });
  });
}
