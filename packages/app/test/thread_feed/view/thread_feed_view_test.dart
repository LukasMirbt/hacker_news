// ignore_for_file: prefer_const_constructors

import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:thread_repository/thread_repository.dart';

import '../../app/pump_app.dart';

class _MockThreadFeedBloc extends MockBloc<ThreadFeedEvent, ThreadFeedState>
    implements ThreadFeedBloc {}

void main() {
  final initialState = ThreadFeedState.initial();

  group(ThreadFeedView, () {
    late ThreadFeedBloc bloc;

    setUp(() {
      bloc = _MockThreadFeedBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThreadFeedView(),
      );
    }

    testWidgets('renders $ThreadFeedRefreshIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadFeedRefreshIndicator), findsOneWidget);
    });

    testWidgets('renders $AlwaysScrollable and $AppErrorBody '
        'when isFailure', (tester) async {
      when(() => bloc.state).thenReturn(
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

    testWidgets('renders $AlwaysScrollable and $ThreadFeedEmptyBody '
        'when !isFailure and isEmpty', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          fetchStatus: FetchStatus.success,
          feed: PaginatedThreadFeedModel.fromRepository(
            PaginatedThreadFeedPlaceholder(),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(
        find.descendant(
          of: find.byType(AlwaysScrollable),
          matching: find.byType(ThreadFeedEmptyBody),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders skeletonized $ThreadFeedBody '
        'when !isFailure, !isEmpty and isPlaceholder ', (tester) async {
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(ThreadFeedBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, true);
    });

    testWidgets('renders non-skeletonized $ThreadFeedBody '
        'when !isFailure, !isEmpty and !isPlaceholder', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          feed: PaginatedThreadFeedModel.fromRepository(
            PaginatedThreadFeedPlaceholder(
              items: [
                OtherUserThreadCommentPlaceholder(),
              ],
            ),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(ThreadFeedBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, false);
    });
  });
}
