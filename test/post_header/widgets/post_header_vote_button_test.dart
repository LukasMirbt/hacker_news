// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart' hide PostHeaderVoteButton;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockPostHeaderState extends Mock implements PostHeaderState {}

class _MockPostHeaderModel extends Mock implements PostHeaderModel {}

void main() {
  const score = 'score';
  const hasBeenUpvoted = true;

  group(PostHeaderVoteButton, () {
    late PostHeaderBloc bloc;
    late PostHeaderState state;
    late PostHeaderModel header;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      state = _MockPostHeaderState();
      header = _MockPostHeaderModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(header);
      when(() => header.score).thenReturn(score);
      when(() => header.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostHeaderVoteButton(score: score),
      );
    }

    AppPostHeaderVoteButton findWidget(WidgetTester tester) {
      return tester.widget<AppPostHeaderVoteButton>(
        find.byType(AppPostHeaderVoteButton),
      );
    }

    testWidgets('has correct score', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.score, score);
    });

    testWidgets('has correct hasBeenUpvoted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.hasBeenUpvoted, hasBeenUpvoted);
    });

    testWidgets('adds $PostHeaderVotePressed onPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onPressed();
      verify(
        () => bloc.add(
          PostHeaderVotePressed(),
        ),
      ).called(1);
    });
  });
}
