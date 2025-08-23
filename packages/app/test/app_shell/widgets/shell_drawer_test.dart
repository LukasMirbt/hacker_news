// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

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

  group(ShellDrawer, () {
    late AppRouter router;
    late StatefulNavigationShell shell;

    setUp(() {
      router = _MockAppRouter();
      shell = _MockStatefulNavigationShell();
      when(() => shell.currentIndex).thenReturn(selectedIndex);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: Provider.value(
          value: shell,
          child: _MockScaffold(
            body: ShellDrawer(),
          ),
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
        final widget = tester.widget<ShellDrawerDestination>(
          find.bySubtype<NavigationDrawerDestination>().at(destination.index),
        );

        expect(
          widget.data,
          destination.data(l10n),
        );
      }
    });

    testWidgets('calls goBranch and closeDrawer '
        'onDestinationSelected', (tester) async {
      const index = 1;
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onDestinationSelected?.call(index);
      final scaffoldState = tester.state<_MockScaffoldState>(
        find.byType(_MockScaffold),
      );
      verify(() => router.goBranch(shell, index)).called(1);
      expect(scaffoldState.calledCloseDrawer, true);
    });
  });
}
