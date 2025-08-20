// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/about/about.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/version/version.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockVersionBloc extends MockBloc<VersionEvent, VersionState>
    implements VersionBloc {}

class _MockVersionState extends Mock implements VersionState {}

class _MockVersionModel extends Mock implements VersionModel {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const label = 'label';

  group(VersionListItem, () {
    late VersionBloc versionBloc;
    late VersionState versionState;
    late VersionModel version;

    setUp(() {
      versionBloc = _MockVersionBloc();
      versionState = _MockVersionState();
      version = _MockVersionModel();
      when(() => versionBloc.state).thenReturn(versionState);
      when(() => versionState.version).thenReturn(version);
      when(() => version.label).thenReturn(label);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: versionBloc,
        child: VersionListItem(),
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
            Symbols.build_rounded,
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
            'title',
            l10n.about_version,
          ),
        );
      });

      testWidgets('has correct trailing', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.trailing,
          isA<SelectableText>().having(
            (icon) => icon.data,
            'data',
            label,
          ),
        );
      });
    });
  });
}
