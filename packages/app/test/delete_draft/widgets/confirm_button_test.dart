// ignore_for_file: prefer_const_constructors

import 'package:app/delete_draft/delete_draft.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../app/pump_app.dart';

class _MockDeleteDraftBloc extends MockBloc<DeleteDraftEvent, DeleteDraftState>
    implements DeleteDraftBloc {}

void main() {
  group(ConfirmButton, () {
    late DeleteDraftBloc bloc;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockDeleteDraftBloc();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider.value(
          value: bloc,
          child: ConfirmButton(),
        ),
      );
    }

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('adds $DeleteDraftConfirmed and pops '
        'when $TextButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(TextButton));
      verify(navigator.pop).called(1);
      verify(
        () => bloc.add(DeleteDraftConfirmed()),
      ).called(1);
    });
  });
}
