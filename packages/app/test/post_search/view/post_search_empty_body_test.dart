// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(PostSearchEmptyBody, () {
    Widget buildSubject() => PostSearchEmptyBody();

    group(AppEmptyBody, () {
      AppEmptyBody findWidget(WidgetTester tester) {
        return tester.widget<AppEmptyBody>(
          find.byType(AppEmptyBody),
        );
      }

      testWidgets('has correct icon', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.icon, Symbols.search_rounded);
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.title, l10n.postSearch_emptyTitle);
      });

      testWidgets('has correct body', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.body, l10n.postSearch_emptyBody);
      });
    });
  });
}
