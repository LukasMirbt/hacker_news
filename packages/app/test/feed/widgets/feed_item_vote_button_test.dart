import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart' hide FeedItemVoteButton;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockFeedItemModel extends Mock implements FeedItemModel {}

void main() {
  const score = 'score';
  const hasBeenUpvoted = true;

  group(FeedItemVoteButton, () {
    late FeedBloc bloc;
    late FeedItemModel item;

    setUp(() {
      bloc = _MockFeedBloc();
      item = _MockFeedItemModel();
      when(() => item.score).thenReturn(score);
      when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedItemVoteButton(
          score: score,
          item: item,
        ),
      );
    }

    AppFeedItemVoteButton findWidget(WidgetTester tester) {
      return tester.widget<AppFeedItemVoteButton>(
        find.byType(AppFeedItemVoteButton),
      );
    }

    testWidgets('has correct score', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.score, score);
    });

    testWidgets('has correct hasBeenUpvoted', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.data.hasBeenUpvoted, hasBeenUpvoted);
    });

    testWidgets('adds $FeedItemVotePressed onPressed', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      widget.data.onPressed();
      verify(
        () => bloc.add(
          FeedItemVotePressed(item),
        ),
      ).called(1);
    });
  });
}
