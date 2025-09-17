// ignore_for_file: prefer_const_constructors

import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../pump_post.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

void main() {
  final initialState = PostState(
    id: 'id',
    fetchStatus: FetchStatus.loading,
    refreshStatus: RefreshStatus.initial,
    post: PostPlaceholder(),
  );

  group(PostView, () {
    late PostBloc postBloc;

    setUp(() {
      postBloc = _MockPostBloc();
      when(() => postBloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: postBloc,
        child: PostView(),
      );
    }

    testWidgets('renders $PostAppBar', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostAppBar), findsOneWidget);
    });

    testWidgets('renders $PostRefreshIndicator', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostRefreshIndicator), findsOneWidget);
    });

    testWidgets('renders $AlwaysScrollable and $AppErrorBody '
        'when isFailure', (tester) async {
      when(() => postBloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
      await tester.pumpPost(buildSubject());
      expect(
        find.descendant(
          of: find.byType(AlwaysScrollable),
          matching: find.byType(AppErrorBody),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders $PostBody when !isFailure', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostBody), findsOneWidget);
    });
  });
}
