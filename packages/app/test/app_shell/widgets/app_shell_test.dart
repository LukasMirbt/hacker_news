// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppShellModel extends Mock implements AppShellModel {}

class _FakeStatefulNavigationShell extends StatefulWidget
    implements StatefulNavigationShell {
  const _FakeStatefulNavigationShell();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }

  @override
  State<_FakeStatefulNavigationShell> createState() =>
      _FakeStatefulNavigationShellState();
}

class _FakeStatefulNavigationShellState
    extends State<_FakeStatefulNavigationShell> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  group(AppShell, () {
    late AppShellModel model;
    late StatefulNavigationShell shell;

    setUp(() {
      model = _MockAppShellModel();
      shell = _FakeStatefulNavigationShell();
      when(() => model.destination).thenReturn(AppDestination.home);
      when(() => model.appBar).thenReturn(
        ShellAppBarModel(AppDestination.home),
      );
      when(() => model.drawer).thenReturn(
        ShellDrawerModel(AppDestination.home),
      );
      when(() => model.resizeToAvoidBottomInset).thenReturn(false);
      when(() => model.shell).thenReturn(shell);
    });

    Widget buildSubject() {
      return Provider.value(
        value: model,
        child: AppShell(),
      );
    }

    group(Scaffold, () {
      Scaffold findWidget(WidgetTester tester) {
        return tester.widget<Scaffold>(
          find.descendant(
            of: find.byType(AppShell),
            matching: find.byType(Scaffold),
          ),
        );
      }

      testWidgets('drawer is $ShellDrawer', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.drawer, isA<ShellDrawer>());
      });

      testWidgets('appBar is $ShellAppBar', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.appBar, isA<ShellAppBar>());
      });

      testWidgets('body renders shell', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          find.descendant(
            of: find.byWidget(widget.body!),
            matching: find.byWidget(shell),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
