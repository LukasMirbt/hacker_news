// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:vote_repository/vote_repository.dart';

import '../../app/pump_app.dart';

class _MockVoteFailureBloc extends MockBloc<VoteFailureEvent, VoteState>
    implements VoteFailureBloc {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(VoteFailureListener, () {
    late VoteFailureBloc bloc;

    setUp(() {
      bloc = _MockVoteFailureBloc();
      when(() => bloc.state).thenReturn(VoteInitial());
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: Nested(
          children: [
            VoteFailureListener(),
          ],
          child: Container(),
        ),
      );
    }

    testWidgets(
      'shows $SnackBar with correct message when state '
      'changes to $VoteFailure',
      (tester) async {
        final state = InvalidVoteUrl();
        whenListen(
          bloc,
          Stream.value(state),
        );
        await tester.pumpApp(buildSubject());
        await tester.pump();
        final message = state.message(l10n);
        expect(
          find.widgetWithText(SnackBar, message),
          findsOneWidget,
        );
      },
    );
  });
}
