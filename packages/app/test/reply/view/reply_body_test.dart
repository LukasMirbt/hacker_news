// ignore_for_file: prefer_const_constructors

import 'package:app/reply/reply.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart' hide ReplyParent;

import '../../app/pump_app.dart';

class _MockReplyBloc extends MockBloc<ReplyEvent, ReplyState>
    implements ReplyBloc {}

class _MockReplyState extends Mock implements ReplyState {}

class _MockReplyFormModel extends Mock implements ReplyFormModel {}

void main() {
  group(ReplyBody, () {
    late ReplyBloc bloc;
    late ReplyState state;
    late ReplyFormModel form;

    setUp(() {
      bloc = _MockReplyBloc();
      state = _MockReplyState();
      form = _MockReplyFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.form).thenReturn(form);
      when(() => state.parent).thenReturn(
        OtherUserReplyParentModel(
          parent: OtherUserReplyParentPlaceholder(),
        ),
      );
      when(() => form.text).thenReturn('text');
      when(() => form.isReplyingEnabled).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyBody(),
      );
    }

    testWidgets('renders $CustomScrollView '
        'and $SliverFillRemaining', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.descendant(
          of: find.byType(CustomScrollView),
          matching: find.byWidgetPredicate(
            (widget) => widget is SliverFillRemaining && !widget.hasScrollBody,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders $ReplyParent', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyParent), findsOneWidget);
    });

    testWidgets('renders $ReplyDivider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyDivider), findsOneWidget);
    });

    testWidgets('renders $ReplyTextField '
        'when isReplyingEnabled', (tester) async {
      when(() => form.isReplyingEnabled).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyTextField), findsOneWidget);
    });

    testWidgets('renders $ReplyDisabledExplanation '
        'when !isReplyingEnabled', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyDisabledExplanation), findsOneWidget);
    });
  });
}
