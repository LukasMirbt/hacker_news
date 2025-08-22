// ignore_for_file: prefer_const_constructors

import 'package:app/data_collection/data_collection.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDataCollectionBloc
    extends MockBloc<DataCollectionEvent, DataCollectionState>
    implements DataCollectionBloc {}

void main() {
  final initialState = DataCollectionState(
    isAnalyticsCollectionEnabled: false,
  );

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

    testWidgets('renders $DataCollectionBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(DataCollectionBody), findsOneWidget);
    });
  });
}
