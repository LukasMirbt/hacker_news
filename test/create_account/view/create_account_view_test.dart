// ignore_for_file: prefer_const_constructors

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

void main() {
  group(CreateAccountView, () {
    late CreateAccountBloc bloc;

    setUp(() {
      bloc = _MockCreateAccountBloc();
      when(() => bloc.state).thenReturn(
        CreateAccountState(from: 'from'),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CreateAccountView(),
      );
    }

    testWidgets('renders $CreateAccountSuccessListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CreateAccountSuccessListener), findsOneWidget);
    });

    testWidgets('renders $CreateAccountAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CreateAccountAppBar), findsOneWidget);
    });

    testWidgets('renders $CreateAccountBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CreateAccountBody), findsOneWidget);
    });
  });
}
