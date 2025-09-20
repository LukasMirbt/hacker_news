// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart' hide PostFeedItem;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

void main() {
  group(FeedPlaceholderItem, () {
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

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedPlaceholderItem(1),
      );
    }

    testWidgets('renders $PostFeedItem', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<PostFeedItem>(
        find.byType(PostFeedItem),
      );
      expect(
        widget.item,
        isA<PostFeedItemModelPlaceholder>(),
      );
    });
  });
}
