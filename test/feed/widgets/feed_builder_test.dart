// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart' hide FeedItem;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockPaginatedFeedModel extends Mock implements PaginatedFeedModel {}

void main() {
  final initialState = FeedState.initial(FeedType.top);

  group(FeedBuilder, () {
    late FeedBloc bloc;
    late PaginatedFeedModel feed;

    setUp(() {
      bloc = _MockFeedBloc();
      feed = _MockPaginatedFeedModel();
      when(() => bloc.state).thenReturn(
        initialState.copyWith(feed: feed),
      );
    });

    FeedBuilder createSubject() => FeedBuilder();

    Widget buildSubject(
      Widget Function(BuildContext) builder,
    ) {
      return BlocProvider.value(
        value: bloc,
        child: Builder(builder: builder),
      );
    }

    group('padding', () {
      test('returns correct value when hasReachedMax', () {
        final builder = createSubject();
        expect(
          builder.padding(hasReachedMax: true),
          EdgeInsets.only(bottom: 24),
        );
      });

      test('returns correct value when !hasReachedMax', () {
        final builder = createSubject();
        expect(
          builder.padding(hasReachedMax: false),
          EdgeInsets.zero,
        );
      });
    });

    group('separatorBuilder', () {
      testWidgets('renders $Divider', (tester) async {
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.separatorBuilder(context, 0),
          ),
        );

        expect(
          find.byWidgetPredicate(
            (Widget widget) => widget is Divider && widget.height == 0,
          ),
          findsOneWidget,
        );
      });
    });

    group('itemBuilder', () {
      testWidgets('renders $FeedItem', (tester) async {
        final item = FeedItemModel(FeedItemPlaceholder());
        when(() => feed.items).thenReturn([item]);
        final builder = createSubject();

        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 0),
          ),
        );

        expect(find.byType(FeedItem), findsOneWidget);
      });
    });

    group('loadingBuilder', () {
      testWidgets('renders $PaginationSpinner', (tester) async {
        final builder = createSubject();
        await tester.pumpApp(buildSubject(builder.loadingBuilder));
        expect(find.byType(PaginationSpinner), findsOneWidget);
      });
    });
  });
}
