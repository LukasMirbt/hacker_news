// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart'
    hide CurrentUserReplyParent, OtherUserReplyParent, ReplyParent;

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

void main() {
  group(ReplyParent, () {
    late ReplyBloc bloc;
    late ReplyState state;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
      when(() => bloc.state).thenReturn(state);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyParent(),
      );
    }

    testWidgets('renders $CurrentUserReplyParent when item '
        'is $CurrentUserReplyParentModel', (tester) async {
      when(() => state.parent).thenReturn(
        OtherUserReplyParentModel(
          parent: OtherUserReplyParentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(CurrentUserReplyParent), findsNothing);
    });

    testWidgets('renders $OtherUserReplyParent when item '
        'is $OtherUserReplyParentModel', (tester) async {
      when(() => state.parent).thenReturn(
        OtherUserReplyParentModel(
          parent: OtherUserReplyParentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(OtherUserReplyParent), findsOneWidget);
    });
  });
}
