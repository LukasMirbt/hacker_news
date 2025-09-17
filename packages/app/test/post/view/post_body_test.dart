// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart';
import 'package:app/post/post.dart';
import 'package:app/post_header/post_header.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart' hide PostHeader;

import '../pump_post.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

void main() {
  group(PostView, () {
    late PostBloc postBloc;

    setUp(() {
      postBloc = _MockPostBloc();
      when(() => postBloc.state).thenReturn(
        PostState(
          id: 'id',
          fetchStatus: FetchStatus.loading,
          refreshStatus: RefreshStatus.initial,
          post: PostPlaceholder(),
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: postBloc,
        child: PostView(),
      );
    }

    testWidgets('renders $CustomScrollView '
        'with $AlwaysScrollableScrollPhysics', (tester) async {
      await tester.pumpPost(buildSubject());
      final widget = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(
        widget.physics,
        isA<AlwaysScrollableScrollPhysics>(),
      );
    });

    testWidgets('renders $PostHeader', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostHeader), findsOneWidget);
    });

    testWidgets('renders $CommentList', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(CommentList), findsOneWidget);
    });
  });
}
