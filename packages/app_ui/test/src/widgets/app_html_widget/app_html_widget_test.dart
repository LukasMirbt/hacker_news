import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/dom.dart' as dom;
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockElement extends Mock implements dom.Element {}

void main() {
  const html = 'html';

  group(AppHtmlWidget, () {
    Widget buildSubject({
      void Function(String)? onLinkPressed,
    }) {
      return AppHtmlWidget(
        html: html,
        onLinkPressed: onLinkPressed ?? (_) {},
      );
    }

    testWidgets('renders $SelectionArea', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SelectionArea), findsOneWidget);
    });

    group(HtmlWidget, () {
      HtmlWidget findWidget(WidgetTester tester) {
        return tester.widget<HtmlWidget>(
          find.byType(HtmlWidget),
        );
      }

      group('factoryBuilder', () {
        testWidgets('returns $AppWidgetFactory', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(
            widget.factoryBuilder?.call(),
            isA<AppWidgetFactory>(),
          );
        });
      });

      group('onTapUrl', () {
        testWidgets('calls onLinkPressed and returns true', (tester) async {
          const url = 'url';
          final calls = <String>[];
          await tester.pumpApp(
            buildSubject(onLinkPressed: calls.add),
          );
          final widget = findWidget(tester);
          expect(widget.onTapUrl?.call(url), true);
          expect(calls, [url]);
        });
      });

      group('customWidgetBuilder', () {
        late dom.Element element;

        setUp(() {
          element = _MockElement();
        });

        testWidgets('returns $PreformattedTextWidget '
            'when localName is "pre"', (tester) async {
          when(() => element.localName).thenReturn('pre');
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(
            widget.customWidgetBuilder?.call(element),
            isA<PreformattedTextWidget>().having(
              (widget) => widget.element,
              'element',
              element,
            ),
          );
        });

        testWidgets('returns null wen localName is not "pre"', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(
            widget.customWidgetBuilder?.call(element),
            null,
          );
        });
      });
    });
  });
}
