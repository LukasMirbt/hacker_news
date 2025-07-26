// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart' hide PostHeaderCommentButton;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockPostHeaderState extends Mock implements PostHeaderState {}

class _MockPostHeaderModel extends Mock implements PostHeaderModel {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  const commentCount = 'commentCount';

  group(PostHeaderCommentButton, () {
    late PostHeaderBloc bloc;
    late PostHeaderState state;
    late PostHeaderModel header;
    late AppRouter router;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      state = _MockPostHeaderState();
      header = _MockPostHeaderModel();
      router = _MockAppRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(header);
      when(() => header.isCommentingEnabled).thenReturn(false);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: bloc,
          child: PostHeaderCommentButton(
            commentCount: commentCount,
          ),
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

    group('onPressed', () {
      testWidgets('navigates to $CommentRoute onPressed '
          'when isCommentingEnabled', (tester) async {
        when(() => header.isCommentingEnabled).thenReturn(true);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.data.onPressed?.call();
        verify(() => router.goRelative(CommentRoute())).called(1);
      });
    });

    testWidgets('is null when !isCommentingEnabled', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.onPressed, null);
    });
  });
}
