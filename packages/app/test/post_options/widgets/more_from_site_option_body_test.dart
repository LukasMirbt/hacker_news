// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/post_options/post_options.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';
import 'package:web_links/web_links.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const urlHost = 'urlHost';

  group(MoreFromSiteOptionBody, () {
    late AppRouter router;
    late MockNavigator navigator;
    late WebLinks webLinks;

    setUp(() {
      router = _MockAppRouter();
      navigator = MockNavigator();
      webLinks = _MockWebLinks();
      when(navigator.canPop).thenReturn(true);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: MockNavigatorProvider(
          navigator: navigator,
          child: MoreFromSiteOptionBody(
            urlHost: urlHost,
            links: webLinks,
          ),
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
            Symbols.folder_rounded,
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
            l10n.postOptions_moreFromSite,
          ),
        );
      });

      testWidgets('has correct subtitle', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.subtitle,
          isA<Text>().having(
            (text) => text.data,
            'text',
            urlHost,
          ),
        );
      });

      testWidgets('pops and navigates to $WebRedirectRoute '
          'onTap', (tester) async {
        final url = Uri.parse('url');
        final fromUrlMethod = () => webLinks.fromUrl(site: urlHost);
        final pushWebRedirect = () => router.push(
          WebRedirectRoute(url: url),
        );
        when(fromUrlMethod).thenReturn(url);
        when(pushWebRedirect).thenAnswer((_) async => null);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onTap?.call();
        verify(fromUrlMethod).called(1);
        verify(navigator.pop).called(1);
        verify(pushWebRedirect).called(1);
      });
    });
  });
}
