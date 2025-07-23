// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

import '../../app/pump_app.dart';

class _MockThreadItemOptionsBloc extends MockBloc<void, ThreadItemOptionsState>
    implements ThreadItemOptionsBloc {}

void main() {
  final item = ThreadFeedItemPlaceholder();

  group(ThreadItemOptionsSheet, () {
    late ThreadItemOptionsBloc bloc;

    setUp(() {
      bloc = _MockThreadItemOptionsBloc();
      when(() => bloc.state).thenReturn(
        ThreadItemOptionsState.from(item),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThreadItemOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $ThreadItemOptionsSheet', (tester) async {
        await tester.pumpAppWithContext(
          (context) => ThreadItemOptionsSheet.show(
            context: context,
            item: item,
          ),
        );
        expect(
          find.byType(ThreadItemOptionsSheet),
          findsOneWidget,
        );
      });
    });

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $ReplyOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOption), findsOneWidget);
    });

    testWidgets('renders $ViewPostOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOption), findsOneWidget);
    });

    testWidgets('renders $OpenOnWebOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OpenOnWebOption), findsOneWidget);
    });
  });
}
