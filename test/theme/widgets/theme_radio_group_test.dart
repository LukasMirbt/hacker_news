// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class _MockThemeState extends Mock implements ThemeState {}

void main() {
  const groupValue = ThemeMode.system;

  group(ThemeRadioGroup, () {
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
        child: ThemeRadioGroup(),
      );
    }

    group(RadioGroup<ThemeMode>, () {
      RadioGroup<ThemeMode> findWidget(WidgetTester tester) {
        return tester.widget<RadioGroup<ThemeMode>>(
          find.byType(RadioGroup<ThemeMode>),
        );
      }

      testWidgets('has correct groupValue', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.groupValue, groupValue);
      });

      testWidgets('adds $ThemeOptionPressed onChanged', (tester) async {
        const value = ThemeMode.dark;
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onChanged(value);
        verify(
          () => bloc.add(
            ThemeOptionPressed(value),
          ),
        ).called(1);
      });

      testWidgets(
        'renders $ThemeRadioOption for each $ThemeMode',
        (tester) async {
          await tester.pumpApp(buildSubject());
          for (final (index, mode) in ThemeMode.values.indexed) {
            final option = tester.widget<ThemeRadioOption>(
              find.byType(ThemeRadioOption).at(index),
            );
            expect(option.value, mode);
          }
        },
      );
    });
  });
}
