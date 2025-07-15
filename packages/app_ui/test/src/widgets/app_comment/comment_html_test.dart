// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppCommentData extends Mock implements AppCommentData {}

void main() {
  const htmlText = 'htmlText';

  group(CommentHtml, () {
    late AppCommentData data;

    setUp(() {
      data = _MockAppCommentData();
      when(() => data.htmlText).thenReturn(htmlText);
      when(() => data.onLinkPressed).thenReturn((_) {});
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: CommentHtml(),
      );
    }

    group(AppHtmlWidget, () {
      AppHtmlWidget findWidget(WidgetTester tester) {
        return tester.widget<AppHtmlWidget>(
          find.byType(AppHtmlWidget),
        );
      }

      group('html', () {
        testWidgets('has correct value', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.html, htmlText);
        });
      });

      group('onLinkPressed', () {
        testWidgets('calls data.onLinkPressed', (tester) async {
          const linkText = 'linkText';

          var count = 0;

          void onLinkPressed(String value) {
            expect(value, linkText);
            count += 1;
          }

          when(() => data.onLinkPressed).thenReturn(onLinkPressed);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onLinkPressed(linkText);
          expect(count, 1);
        });
      });
    });
  });
}
