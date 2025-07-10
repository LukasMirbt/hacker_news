// ignore_for_file: prefer_const_constructors

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

  group(AnalyticsSwitch, () {
    late DataCollectionBloc bloc;

    setUp(() {
      bloc = _MockDataCollectionBloc();
      when(() => bloc.state).thenReturn(DataCollectionState());
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AnalyticsSwitch(),
      );
    }

    group(SwitchListTile, () {
      SwitchListTile findWidget(WidgetTester tester) {
        return tester.widget<SwitchListTile>(
          find.byType(SwitchListTile),
        );
      }

      testWidgets('value is true when '
          'isAnalyticsCollectionEnabled', (tester) async {
        when(() => bloc.state).thenReturn(
          initialState.copyWith(
            isAnalyticsCollectionEnabled: true,
          ),
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.value, true);
      });

      testWidgets('value is false when '
          '!isAnalyticsCollectionEnabled', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.value, false);
      });

      testWidgets(
        'adds $DataCollectionAnalyticsToggled onChanged',
        (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onChanged?.call(true);
          verify(
            () => bloc.add(
              DataCollectionAnalyticsToggled(),
            ),
          ).called(1);
        },
      );
    });
  });
}
