// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/version/version.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockScaffold extends Scaffold {
  const _MockScaffold({required super.body});

  @override
  ScaffoldState createState() => _MockScaffoldState();
}

class _MockScaffoldState extends ScaffoldState {
  bool calledCloseDrawer = false;

  @override
  void closeDrawer() {
    calledCloseDrawer = true;
  }
}

class _MockStatefulNavigationShell extends Mock
    with Diagnosticable
    implements StatefulNavigationShell {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const selectedIndex = 0;

  group(AppNavigationDrawer, () {
    late StatefulNavigationShell shell;

    setUp(() {
      shell = _MockStatefulNavigationShell();
      when(() => shell.currentIndex).thenReturn(selectedIndex);
    });

    Widget buildSubject() {
      return Provider.value(
        value: shell,
        child: _MockScaffold(
          body: AppNavigationDrawer(),
        ),
      );
    }

    NavigationDrawer findWidget(WidgetTester tester) {
      return tester.widget<NavigationDrawer>(
        find.byType(NavigationDrawer),
      );
    }

    testWidgets('has correct selectedIndex', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.selectedIndex, selectedIndex);
    });

    testWidgets('has correct destinations', (tester) async {
      await tester.pumpApp(buildSubject());

      for (final destination in AppDestination.values) {
        final widget = tester.widget<NavigationDrawerDestination>(
          find.byType(NavigationDrawerDestination).at(destination.index),
        );

        expect(
          widget.label,
          isA<Text>().having(
            (text) => text.data,
            'label',
            destination.label(l10n),
          ),
        );

        expect(
          widget.icon,
          isA<Icon>().having(
            (icon) => icon.icon,
            'icon',
            destination.icon,
          ),
        );

        expect(
          widget.selectedIcon,
          isA<Icon>().having(
            (icon) => icon.icon,
            'selectedIcon',
            destination.selectedIcon,
          ),
        );
      }
    });

    testWidgets('calls goBranch onDestinationSelected', (tester) async {
      const index = 1;
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onDestinationSelected?.call(index);
      verify(() => shell.goBranch(index)).called(1);
    });

    testWidgets('calls closeDrawer onDestinationSelected', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onDestinationSelected?.call(1);
      final scaffoldState = tester.state<_MockScaffoldState>(
        find.byType(_MockScaffold),
      );
      expect(scaffoldState.calledCloseDrawer, true);
    });

    testWidgets('renders $CurrentVersion', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CurrentVersion), findsOneWidget);
    });
  });
}
