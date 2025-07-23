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
  const replyUrl = 'replyUrl';

  group(ReplyOption, () {
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
        child: ReplyOption(),
      );
    }

    testWidgets('renders $ReplyOptionBody when replyUrl '
        'is non-null', (tester) async {
      when(() => item.replyUrl).thenReturn(replyUrl);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOptionBody), findsOneWidget);
    });

    testWidgets('does not render $ReplyOptionBody when replyUrl '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOptionBody), findsNothing);
    });
  });
}
