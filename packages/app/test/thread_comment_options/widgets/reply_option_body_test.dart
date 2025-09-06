// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/reply/reply.dart';
import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const url = 'url';

  group(ReplyOptionBody, () {
    late AppRouter router;
    late MockNavigator navigator;

    setUp(() {
      router = _MockAppRouter();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: MockNavigatorProvider(
          navigator: navigator,
          child: ReplyOptionBody(url: url),
        ),
      );
    }

    group(ListTile, () {
      ListTile findWidget(WidgetTester tester) {
        return tester.widget<ListTile>(
          find.byType(ListTile),
        );
      }

      testWidgets('has correct leading', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.leading,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.reply_rounded,
          ),
        );
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'text',
            l10n.threadCommentOptions_reply,
          ),
        );
      });

      testWidgets('pops and navigates to $ReplyRoute onTap', (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(ListTile));
        verify(navigator.pop).called(1);
        verify(
          () => router.goRelative(
            ReplyRoute(url: url),
          ),
        ).called(1);
      });
    });
  });
}
