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

void main() {
  group(ReplyBody, () {
    late ReplyBloc bloc;

    setUp(() {
      bloc = _MockReplyBloc();
      when(() => bloc.state).thenReturn(
        ReplyState.initial(url: 'url'),
      );
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

    testWidgets('renders $ReplyTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyTextField), findsOneWidget);
    });
  });
}
