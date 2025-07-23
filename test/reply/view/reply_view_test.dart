// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

void main() {
  final initialState = ReplyState.initial(url: 'url');

  group(ReplyView, () {
    late ReplyBloc bloc;

    setUp(() {
      bloc = _MockReplyBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyView(),
      );
    }

    testWidgets('renders $ReplySuccessListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplySuccessListener), findsOneWidget);
    });

    testWidgets('renders $ReplyFailureListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFailureListener), findsOneWidget);
    });

    testWidgets('renders $AppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders $ErrorText when isFailure', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(ErrorText), findsOneWidget);
    });

    testWidgets('renders $Spinner when !isFailure '
        'and isLoading', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Spinner), findsOneWidget);
    });

    testWidgets('renders $ReplyBody when !isFailure '
        'and !isLoading', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.success,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyBody), findsOneWidget);
    });
  });
}
