// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

class _MockReplyFormModel extends Mock implements ReplyFormModel {}

void main() {
  group(ReplyHtml, () {
    late ReplyBloc bloc;
    late ReplyState state;
    late ReplyFormModel form;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
      form = _MockReplyFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyHtml(
          padding: EdgeInsets.zero,
        ),
      );
    }

    testWidgets('renders $ReplyHtmlBody when htmlText '
        'is non-null', (tester) async {
      when(() => form.htmlText).thenReturn('htmlText');
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyHtmlBody), findsOneWidget);
    });

    testWidgets('does not render $ReplyHtmlBody when htmlText '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyHtmlBody), findsNothing);
    });
  });
}
