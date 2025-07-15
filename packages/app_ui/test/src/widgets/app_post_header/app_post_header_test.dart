import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group(AppPostHeader, () {
    Widget buildSubject({AppPostHeaderData? data}) {
      return AppPostHeader(
        data: data ?? AppPostHeaderDataPlaceholder(),
      );
    }

    testWidgets('renders $PostHeaderBody '
        'when htmlText is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeaderBody), findsOneWidget);
    });

    testWidgets('renders $PostHeaderBodyWithHtml '
        'when htmlText is non-null', (tester) async {
      await tester.pumpApp(
        buildSubject(
          data: AppPostHeaderDataPlaceholder(
            htmlText: 'htmlText',
          ),
        ),
      );
      expect(find.byType(PostHeaderBodyWithHtml), findsOneWidget);
    });
  });
}
