// ignore_for_file: prefer_const_constructors

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

  group(ReplyFormHtml, () {
    late ReplyFormBloc bloc;

    setUp(() {
      bloc = _MockReplyFormBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyFormHtml(
          padding: EdgeInsets.zero,
        ),
      );
    }

    testWidgets('renders $ReplyFormHtmlBody when htmlText '
        'is non-null', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          replyForm: ReplyFormModel(
            ReplyFormPlaceholder(
              htmlText: 'htmlText',
            ),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFormHtmlBody), findsOneWidget);
    });

    testWidgets('does not render $ReplyFormHtmlBody when htmlText '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFormHtmlBody), findsNothing);
    });
  });
}
