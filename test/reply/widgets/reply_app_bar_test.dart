// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

void main() {
  group(ReplyAppBar, () {
    late ReplyBloc bloc;
    late ReplyState state;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.isSubmittingEnabled).thenReturn(false);
      when(() => state.form).thenReturn(
        ReplyFormModel(
          form: ReplyFormPlaceholder(),
          text: '',
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyAppBar(),
      );
    }

    testWidgets('renders $ReplySubmitButton '
        'when isSubmittingEnabled', (tester) async {
      when(() => state.isSubmittingEnabled).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplySubmitButton), findsOneWidget);
    });

    testWidgets('does not render $ReplySubmitButton '
        'when !isSubmittingEnabled', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplySubmitButton), findsNothing);
    });
  });
}
