// ignore_for_file: prefer_const_constructors

import 'package:app/feed_item_options/feed_item_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedItemOptionsBloc extends MockBloc<void, FeedItemOptionsState>
    implements FeedItemOptionsBloc {}

void main() {
  final item = PostFeedItemPlaceholder();

  group(FeedItemOptionsSheet, () {
    late FeedItemOptionsBloc bloc;

    setUp(() {
      bloc = _MockFeedItemOptionsBloc();
      when(() => bloc.state).thenReturn(
        FeedItemOptionsState.from(item),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedItemOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $FeedItemOptionsSheet', (tester) async {
        await tester.pumpAppWithContext(
          (context) => FeedItemOptionsSheet.show(
            context: context,
            item: item,
          ),
        );
        expect(
          find.byType(FeedItemOptionsSheet),
          findsOneWidget,
        );
      });
    });

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $OpenOnWebOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OpenOnWebOption), findsOneWidget);
    });
  });
}
