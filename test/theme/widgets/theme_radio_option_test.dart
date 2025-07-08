// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class _MockThemeState extends Mock implements ThemeState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const value = ThemeMode.dark;
  const groupValue = ThemeMode.system;

  group(ThemeRadioOption, () {
    late ThemeBloc bloc;
    late ThemeState state;

    setUp(() {
      bloc = _MockThemeBloc();
      state = _MockThemeState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.mode).thenReturn(groupValue);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThemeRadioOption(value),
      );
    }

    RadioListTile<ThemeMode> findWidget(WidgetTester tester) {
      return tester.widget<RadioListTile<ThemeMode>>(
        find.byType(RadioListTile<ThemeMode>),
      );
    }

    testWidgets('has correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      final label = value.label(l10n);
      final widget = findWidget(tester);
      expect(
        widget.title,
        isA<Text>().having(
          (text) => text.data,
          'data',
          label,
        ),
      );
    });

    testWidgets('has correct value', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.value, value);
    });

    testWidgets('has correct groupValue', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.groupValue, groupValue);
    });

    testWidgets('adds $ThemeOptionPressed onChanged', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.onChanged?.call(value);
      verify(
        () => bloc.add(
          ThemeOptionPressed(value),
        ),
      ).called(1);
    });
  });
}
