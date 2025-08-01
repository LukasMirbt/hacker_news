// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppFeedItemData extends Mock implements AppFeedItemData {}

void main() {
  group(FeedItemVoteButton, () {
    late AppFeedItemData data;

    setUp(() {
      data = _MockAppFeedItemData();
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: FeedItemVoteButton(),
      );
    }

    testWidgets('renders $FeedItemButtonPlaceholder '
        'when data is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byType(FeedItemButtonPlaceholder),
        findsOneWidget,
      );
    });

    testWidgets('renders voteButton when non-null', (tester) async {
      final voteButton = Container();
      when(() => data.voteButton).thenReturn(voteButton);
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(voteButton), findsOneWidget);
    });
  });
}
