// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

class _MockCreateAccountState extends Mock implements CreateAccountState {}

class _MockCreateAccountFormModel extends Mock
    implements CreateAccountFormModel {}

void main() {
  group(CreateAccountPasswordVisibilityButton, () {
    late CreateAccountBloc bloc;
    late CreateAccountState state;
    late CreateAccountFormModel form;

    setUp(() {
      bloc = _MockCreateAccountBloc();
      state = _MockCreateAccountState();
      form = _MockCreateAccountFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      when(() => form.obscurePassword).thenReturn(true);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CreateAccountPasswordVisibilityButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets(
      'adds $CreateAccountPasswordVisibilityButton when $IconButton '
      'is pressed',
      (tester) async {
        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(IconButton));
        verify(
          () => bloc.add(
            CreateAccountPasswordVisibilityToggled(),
          ),
        ).called(1);
      },
    );

    testWidgets('renders correct icon when obscurePassword', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byIcon(Symbols.visibility_rounded),
        findsOneWidget,
      );
    });

    testWidgets('renders correct icon when !obscurePassword', (tester) async {
      when(() => form.obscurePassword).thenReturn(false);
      await tester.pumpApp(buildSubject());
      expect(
        find.byIcon(Symbols.visibility_off_rounded),
        findsOneWidget,
      );
    });
  });
}
