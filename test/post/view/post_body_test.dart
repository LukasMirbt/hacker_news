// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart' hide PostHeader;

import '../../app/pump_app.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockCommentListBloc extends MockBloc<CommentListEvent, CommentListState>
    implements CommentListBloc {}

void main() {
  group(PostView, () {
    late PostBloc postBloc;
    late PostHeaderBloc postHeaderBloc;
    late CommentListBloc commentListBloc;

    setUp(() {
      postBloc = _MockPostBloc();
      postHeaderBloc = _MockPostHeaderBloc();
      commentListBloc = _MockCommentListBloc();
      when(() => postBloc.state).thenReturn(
        PostState(
          id: 'id',
          fetchStatus: FetchStatus.loading,
          refreshStatus: RefreshStatus.initial,
        ),
      );
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

    testWidgets('renders $CustomScrollView '
        'with $AlwaysScrollableScrollPhysics', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(
        widget.physics,
        isA<AlwaysScrollableScrollPhysics>(),
      );
    });

    testWidgets('renders $PostHeader', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostHeader), findsOneWidget);
    });

    testWidgets('renders $CommentSliverList', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentSliverList), findsOneWidget);
    });
  });
}
