// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart' hide PostHeaderCommentButton;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockPostHeaderState extends Mock implements PostHeaderState {}

void main() {
  const commentCount = 'commentCount';

  group(PostHeaderCommentButton, () {
    late PostHeaderBloc bloc;
    late PostHeaderState state;
    late GoRouter router;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      state = _MockPostHeaderState();
      router = _MockGoRouter();
      when(() => bloc.state).thenReturn(state);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostHeaderCommentButton(
          commentCount: commentCount,
        ),
      );
    }

    AppPostHeaderCommentButton findWidget(WidgetTester tester) {
      return tester.widget<AppPostHeaderCommentButton>(
        find.byType(AppPostHeaderCommentButton),
      );
    }

    testWidgets('has correct commentCount', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.commentCount, commentCount);
    });

    testWidgets('navigates to $CommentFormRoute onPressed', (tester) async {
      const postId = 'postId';
      when(() => state.id).thenReturn(postId);
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      final widget = findWidget(tester);
      widget.data.onPressed();
      const route = CommentFormRoute(postId: postId);
      verify(() => router.go(route.location)).called(1);
    });
  });
}
