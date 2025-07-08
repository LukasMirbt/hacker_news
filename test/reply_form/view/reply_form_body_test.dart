// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockReplyFormBloc extends MockBloc<ReplyFormEvent, ReplyFormState>
    implements ReplyFormBloc {}

void main() {
  group(ReplyFormBody, () {
    late ReplyFormBloc bloc;

    setUp(() {
      bloc = _MockReplyFormBloc();
      when(() => bloc.state).thenReturn(
        ReplyFormState.initial(
          commentId: 'commentId',
          post: PostPlaceholder(),
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyFormBody(),
      );
    }

    testWidgets('renders $SingleChildScrollView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders $ReplyFormHtml', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFormHtml), findsOneWidget);
    });

    testWidgets('renders $ReplyFormTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyFormTextField), findsOneWidget);
    });

    testWidgets('renders $ReplyButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyButton), findsOneWidget);
    });
  });
}
