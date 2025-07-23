// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockThreadItemOptionsBloc extends MockBloc<void, ThreadItemOptionsState>
    implements ThreadItemOptionsBloc {}

class _MockThreadItemOptionsState extends Mock
    implements ThreadItemOptionsState {}

class _MockThreadItemModel extends Mock implements ThreadItemModel {}

void main() {
  const postId = 'postId';

  group(ViewPostOption, () {
    late ThreadItemOptionsBloc bloc;
    late ThreadItemOptionsState state;
    late ThreadItemModel item;

    setUp(() {
      bloc = _MockThreadItemOptionsBloc();
      state = _MockThreadItemOptionsState();
      item = _MockThreadItemModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.item).thenReturn(item);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ViewPostOption(),
      );
    }

    testWidgets('renders $ViewPostOptionBody when postId '
        'is non-null', (tester) async {
      when(() => item.postId).thenReturn(postId);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOptionBody), findsOneWidget);
    });

    testWidgets('does not render $ViewPostOptionBody when postId '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOptionBody), findsNothing);
    });
  });
}
