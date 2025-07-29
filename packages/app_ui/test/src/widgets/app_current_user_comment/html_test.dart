// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/app_current_user_comment/app_current_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppCurrentUserCommentData extends Mock
    implements AppCurrentUserCommentData {}

void main() {
  const htmlText = 'htmlText';

  group(Html, () {
    late AppCurrentUserCommentData data;

    setUp(() {
      data = _MockAppCurrentUserCommentData();
      when(() => data.htmlText).thenReturn(htmlText);
      when(() => data.onLinkPressed).thenReturn((_) {});
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Html(),
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
