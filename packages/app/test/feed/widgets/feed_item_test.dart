import 'package:app/feed/feed.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart'
    hide FeedItem, JobFeedItem, PostFeedItem;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

void main() {
  group(FeedItem, () {
    late FeedBloc bloc;

    setUp(() {
      bloc = _MockFeedBloc();
      when(() => bloc.state).thenReturn(
        FeedState.initial(
          type: FeedType.top,
          visitedPosts: {},
        ),
      );
    });

    Widget buildSubject(FeedItemModel item) {
      return BlocProvider.value(
        value: bloc,
        child: FeedItem(item),
      );
    }

    testWidgets('renders $PostFeedItem when item '
        'is $PostFeedItemModel', (tester) async {
      await tester.pumpApp(
        buildSubject(
          PostFeedItemModel(
            PostFeedItemPlaceholder(),
          ),
        ),
      );
      expect(find.byType(PostFeedItem), findsOneWidget);
    });

    testWidgets('renders $JobFeedItem when item '
        'is $JobFeedItemModel', (tester) async {
      await tester.pumpApp(
        buildSubject(
          JobFeedItemModel(
            JobFeedItemPlaceholder(),
          ),
        ),
      );
      expect(find.byType(JobFeedItem), findsOneWidget);
    });
  });
}
