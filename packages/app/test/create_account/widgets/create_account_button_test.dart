// ignore_for_file: prefer_const_constructors

import 'package:app/create_account/create_account.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCreateAccountBloc
    extends MockBloc<CreateAccountEvent, CreateAccountState>
    implements CreateAccountBloc {}

class _MockCreateAccountState extends Mock implements CreateAccountState {}

class _MockCreateAccountFormModel extends Mock
    implements CreateAccountFormModel {}

void main() {
  group(CreateAccountButton, () {
    late CreateAccountBloc bloc;
    late CreateAccountState state;
    late CreateAccountFormModel form;

    setUp(() {
      bloc = _MockCreateAccountBloc();
      state = _MockCreateAccountState();
      form = _MockCreateAccountFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      when(() => form.isLoading).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CreateAccountButton(),
      );
    }

    group(AppFilledButton, () {
      AppFilledButton findWidget(WidgetTester tester) {
        return tester.widget<AppFilledButton>(
          find.byType(AppFilledButton),
        );
      }

      group('isLoading', () {
        testWidgets('is true when state.isLoading', (tester) async {
          when(() => form.isLoading).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, true);
        });

        testWidgets('is false when !state.isLoading', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, false);
        });
      });

      testWidgets('adds $CreateAccountSubmitted onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(
          () => bloc.add(CreateAccountSubmitted()),
        ).called(1);
      });
    });
  });
}
