// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(PostAppBar, () {
    Widget buildSubject() => PostAppBar();

    testWidgets('renders $Hero with correct tag', (tester) async {
      await tester.pumpApp(buildSubject());
      final hero = tester.widget<Hero>(
        find.byType(Hero),
      );
      expect(hero.tag, PostAppBar.heroTag);
    });

    group(AppBar, () {
      AppBar findWidget(WidgetTester tester) {
        return tester.widget<AppBar>(
          find.byType(AppBar),
        );
      }

      testWidgets('has correct leading', (tester) async {
        await tester.pumpApp(buildSubject());
        final appBar = findWidget(tester);
        expect(appBar.leading, isA<PostBackButton>());
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'text',
            l10n.post_title,
          ),
        );
      });

      testWidgets('has correct actionsPadding', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.actionsPadding,
          EdgeInsets.only(right: AppSpacing.xs),
        );
      });

      testWidgets('has correct actions', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.actions,
          [
            isA<PostSearchButton>(),
            isA<PostOptionsButton>(),
          ],
        );
      });
    });
  });
}
