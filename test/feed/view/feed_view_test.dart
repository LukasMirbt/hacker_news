// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

void main() {
  final initialState = FeedState.initial(
    type: FeedType.top,
    visitedPosts: {},
  );

  group(FeedView, () {
    late FeedBloc bloc;

    setUp(() {
      bloc = _MockFeedBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedView(),
      );
    }

    testWidgets('renders $FeedRefreshIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedRefreshIndicator), findsOneWidget);
    });

    testWidgets('renders $FeedItemPressListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemPressListener), findsOneWidget);
    });

    testWidgets('renders $AlwaysScrollable and $ErrorText '
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
          matching: find.byType(ErrorText),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders skeletonized $FeedBody when !isFailure '
        'and isPlaceholder ', (tester) async {
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(FeedBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, true);
    });

    testWidgets('renders non-skeletonized $FeedBody when !isFailure '
        'and !isPlaceholder', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          feed: PaginatedFeedModel.fromRepository(
            PaginatedFeedPlaceholder(),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      final skeletonizerScope = tester.widget<SkeletonizerScope>(
        find.ancestor(
          of: find.byType(FeedBody),
          matching: find.byType(SkeletonizerScope),
        ),
      );
      expect(skeletonizerScope.enabled, false);
    });
  });
}
