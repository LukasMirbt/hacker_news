// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply_form.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockReplyFormBloc extends MockBloc<ReplyFormEvent, ReplyFormState>
    implements ReplyFormBloc {}

void main() {
  final initialState = ReplyFormState.initial(
    commentId: 'commentId',
    post: PostPlaceholder(),
  );

  group(ReplyFormView, () {
    late ReplyFormBloc bloc;

    setUp(() {
      bloc = _MockReplyFormBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyFormView(),
      );
    }

    testWidgets('renders $ReplyFormSuccessListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFormSuccessListener), findsOneWidget);
    });

    testWidgets('renders $ReplyFormFailureListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFormFailureListener), findsOneWidget);
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

    testWidgets('renders $ReplyFormBody when !isFailure '
        'and !isLoading', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.success,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFormBody), findsOneWidget);
    });
  });
}
