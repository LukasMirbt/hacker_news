// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/about/about.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAboutBloc extends MockBloc<AboutEvent, void> implements AboutBloc {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(PrivacyPolicyListItem, () {
    late AboutBloc bloc;

    setUp(() {
      bloc = _MockAboutBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PrivacyPolicyListItem(),
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
            Symbols.privacy_tip_rounded,
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
            l10n.about_privacyPolicy,
          ),
        );
      });

      testWidgets('has correct trailing', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.trailing,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.launch_rounded,
          ),
        );
      });

      testWidgets('adds $AboutPrivacyPolicyPressed when $ListTile '
          'is tapped', (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(ListTile));
        verify(
          () => bloc.add(
            AboutPrivacyPolicyPressed(),
          ),
        ).called(1);
      });
    });
  });
}
