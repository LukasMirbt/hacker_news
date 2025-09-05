// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_router/app_router.dart';
import 'package:app/comment_options/comment_options.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final url = Uri.parse('url');

  group(DeleteOptionBody, () {
    late AppRouter router;

    setUp(() {
      router = _MockAppRouter();
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: DeleteOptionBody(url: url),
      );
    }

    ListTile findWidget(WidgetTester tester) {
      return tester.widget<ListTile>(
        find.byType(ListTile),
      );
    }

    ColorScheme findColorScheme(WidgetTester tester) {
      final context = tester.element(
        find.byType(DeleteOptionBody),
      );
      return ColorScheme.of(context);
    }

    group(ListTile, () {
      testWidgets('has correct textColor', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final colorScheme = findColorScheme(tester);
        expect(widget.textColor, colorScheme.error);
      });

      testWidgets('has correct iconColor', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final colorScheme = findColorScheme(tester);
        expect(widget.iconColor, colorScheme.error);
      });

      testWidgets('has correct leading', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.leading,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.delete_rounded,
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
            'data',
            l10n.commentOptions_delete,
          ),
        );
      });

      testWidgets('pops and navigates to $WebRedirectRoute '
          'onTap', (tester) async {
        final pushWebRedirect = () => router.push(
          WebRedirectRoute(url: url),
        );
        when(pushWebRedirect).thenAnswer((_) async => null);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onTap?.call();
        verify(pushWebRedirect).called(1);
      });
    });
  });
}
