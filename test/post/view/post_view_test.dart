// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../app/pump_app.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

void main() {
  final initialState = PostState(
    id: 'id',
    fetchStatus: FetchStatus.loading,
    refreshStatus: RefreshStatus.initial,
  );

  group(PostView, () {
    late PostBloc postBloc;
    late PostHeaderBloc postHeaderBloc;
    late CommentListBloc commentListBloc;

    setUp(() {
      postBloc = _MockPostBloc();
      postHeaderBloc = _MockPostHeaderBloc();
      commentListBloc = _MockCommentListBloc();
      when(() => postBloc.state).thenReturn(initialState);
      when(() => postHeaderBloc.state).thenReturn(
        PostHeaderState.initial(
          id: 'id',
          visitedPosts: {},
        ),
      );
      when(() => commentListBloc.state).thenReturn(
        CommentListState.initial(id: 'id'),
      );
    });

    Widget buildSubject() {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: postBloc),
          BlocProvider.value(value: postHeaderBloc),
          BlocProvider.value(value: commentListBloc),
        ],
        child: PostView(),
      );
    }

    testWidgets('renders $PostAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostAppBar), findsOneWidget);
    });

    testWidgets('renders $PostRefreshIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostRefreshIndicator), findsOneWidget);
    });

    testWidgets('renders $AlwaysScrollable and $AppErrorBody '
        'when isFailure', (tester) async {
      when(() => postBloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(
        find.descendant(
          of: find.byType(AlwaysScrollable),
          matching: find.byType(AppErrorBody),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders skeletonized $PostBody when !isFailure '
        'and isLoading ', (tester) async {
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(PostBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, true);
    });

    testWidgets('renders non-skeletonized $PostBody when !isFailure '
        'and !isLoading', (tester) async {
      when(() => postBloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.success,
        ),
      );
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(PostBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, false);
    });
  });
}
