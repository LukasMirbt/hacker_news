// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:vote_repository/vote_repository.dart';

import '../../app/pump_app.dart';

class _MockVoteFailureBloc extends MockBloc<VoteFailureEvent, VoteState>
    implements VoteFailureBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const currentLocation = 'currentLocation';

  group(VoteFailureListener, () {
    late VoteFailureBloc bloc;
    late AppRouter router;

    setUp(() {
      bloc = _MockVoteFailureBloc();
      router = _MockAppRouter();
      when(() => bloc.state).thenReturn(VoteInitial());
      when(() => router.currentLocation).thenReturn(currentLocation);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: bloc,
          child: Nested(
            children: [
              VoteFailureListener(),
            ],
            child: Container(),
          ),
        ),
      );
    }

    testWidgets('navigates to $LoginRoute when state '
        'changes to $UnauthenticatedVote', (tester) async {
      final state = UnauthenticatedVote();
      whenListen(
        bloc,
        Stream.value(state),
      );
      final pushLoginRoute = () => router.push(
        LoginRoute(from: currentLocation),
      );
      when(pushLoginRoute).thenAnswer((_) async => null);
      await tester.pumpApp(buildSubject());
      verify(pushLoginRoute).called(1);
    });

    testWidgets('shows $SnackBar with correct message when state '
        'changes to $InvalidVoteUrl', (tester) async {
      final state = InvalidVoteUrl();
      whenListen(
        bloc,
        Stream.value(state),
      );
      await tester.pumpApp(buildSubject());
      await tester.pump();
      expect(
        find.widgetWithText(
          SnackBar,
          l10n.voteFailure_invalidUrl,
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows $SnackBar with correct message when state '
        'changes to $UnknownVoteFailure', (tester) async {
      final state = UnknownVoteFailure();
      whenListen(
        bloc,
        Stream.value(state),
      );
      await tester.pumpApp(buildSubject());
      await tester.pump();
      expect(
        find.widgetWithText(
          SnackBar,
          l10n.generalServerError,
        ),
        findsOneWidget,
      );
    });
  });
}
