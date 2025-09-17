// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/comment_list/comment_list.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CommentListEmptyBody, () {
    Widget buildSubject() {
      return CustomScrollView(
        slivers: [
          CommentListEmptyBody(),
        ],
      );
    }

    testWidgets('renders $SliverFillRemaining', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<SliverFillRemaining>(
        find.ancestor(
          of: find.byType(AppEmptyBody),
          matching: find.byType(SliverFillRemaining),
        ),
      );
      expect(widget.hasScrollBody, false);
    });

    group(AppEmptyBody, () {
      AppEmptyBody findWidget(WidgetTester tester) {
        return tester.widget<AppEmptyBody>(
          find.byType(AppEmptyBody),
        );
      }

      testWidgets('has correct icon', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.icon, Symbols.mode_comment_rounded);
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.title, l10n.commentList_emptyTitle);
      });

      testWidgets('has correct body', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.body, l10n.commentList_emptyBody);
      });
    });
  });
}
