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

void main() {
  group(ThemeRadioGroup, () {
    late ThemeBloc bloc;

    setUp(() {
      bloc = _MockThemeBloc();
      when(() => bloc.state).thenReturn(ThemeState());
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThemeRadioGroup(),
      );
    }

    testWidgets(
      'renders $ThemeRadioOption for each $ThemeMode',
      (tester) async {
        await tester.pumpApp(buildSubject());
        for (final (index, mode) in ThemeRadioGroup.modes.indexed) {
          final option = tester.widget<ThemeRadioOption>(
            find.byType(ThemeRadioOption).at(index),
          );
          expect(option.value, mode);
        }
      },
    );
  });
}
