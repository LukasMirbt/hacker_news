// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/data_collection/data_collection.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDataCollectionBloc
    extends MockBloc<DataCollectionEvent, DataCollectionState>
    implements DataCollectionBloc {}

void main() {
  final initialState = DataCollectionState();

  group(DataCollectionView, () {
    late DataCollectionBloc bloc;

    setUp(() {
      bloc = _MockDataCollectionBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: DataCollectionView(),
      );
    }

    testWidgets('renders $AppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders $Spinner when isLoading', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Spinner), findsOneWidget);
    });

    testWidgets('renders $DataCollectionBody when !isLoading', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(status: DataCollectionStatus.success),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(DataCollectionBody), findsOneWidget);
    });
  });
}
