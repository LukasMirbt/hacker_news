// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

import '../../app/pump_app.dart';

class _MockScaffold extends Scaffold {
  const _MockScaffold({required super.body});

  @override
  ScaffoldState createState() => _MockScaffoldState();
}

class _MockScaffoldState extends ScaffoldState {
  bool calledOpenDrawer = false;

  @override
  void openDrawer() {
    calledOpenDrawer = true;
  }
}

void main() {
  group(UserAvatar, () {
    Widget buildSubject() {
      return _MockScaffold(
        body: UserAvatar(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls openDrawer when $IconButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      final scaffoldState = tester.state<_MockScaffoldState>(
        find.byType(_MockScaffold),
      );
      expect(scaffoldState.calledOpenDrawer, true);
    });

    testWidgets('renders $AppUserAvatar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppUserAvatar), findsOneWidget);
    });
  });
}
