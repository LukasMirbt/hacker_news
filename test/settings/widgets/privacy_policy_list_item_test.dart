// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockSettingsBloc extends MockBloc<SettingsEvent, void>
    implements SettingsBloc {}

void main() {
  group(PrivacyPolicyListItem, () {
    late SettingsBloc bloc;

    setUp(() {
      bloc = _MockSettingsBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PrivacyPolicyListItem(),
      );
    }

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('adds $SettingsPrivacyPolicyPressed when $ListTile '
        'is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(
        () => bloc.add(
          SettingsPrivacyPolicyPressed(),
        ),
      ).called(1);
    });
  });
}
