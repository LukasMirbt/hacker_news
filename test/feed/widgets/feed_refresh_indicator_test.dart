// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedBloc extends MockBloc<FeedEvent, FeedState>
    implements FeedBloc {}

class _MockCompleter extends Mock implements Completer<void> {}

void main() {
  final child = Container();
  final initialState = FeedState.initial(FeedType.top);

  group(FeedRefreshIndicator, () {
    late FeedBloc bloc;
    late Completer<void> completer;
    late StreamController<FeedState> controller;

    setUp(() {
      bloc = _MockFeedBloc();
      completer = _MockCompleter();
      controller = StreamController.broadcast();
      when(() => bloc.state).thenReturn(initialState);
      when(() => bloc.stream).thenAnswer((_) => controller.stream);
    });

    tearDown(() {
      controller.close();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: FeedRefreshIndicator(
          child: child,
          createCompleter: () => completer,
        ),
      );
    }

    testWidgets('renders $RefreshIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(RefreshIndicator), findsOneWidget);
    });

    testWidgets('creates completer, adds $FeedRefreshTriggered '
        'and returns completer.future', (tester) async {
      final future = Future<void>.value();
      when(() => completer.future).thenAnswer((_) => future);
      await tester.pumpApp(buildSubject());
      final refreshIndicator = tester.widget<RefreshIndicator>(
        find.byType(RefreshIndicator),
      );
      expect(refreshIndicator.onRefresh(), future);
      verify(() => bloc.add(FeedRefreshTriggered())).called(1);
    });

    testWidgets('calls completer.complete when refreshStatus '
        'changes to !isLoading', (tester) async {
      when(() => completer.future).thenAnswer((_) async {});
      await tester.pumpApp(buildSubject());
      final refreshIndicator = tester.widget<RefreshIndicator>(
        find.byType(RefreshIndicator),
      );
      await refreshIndicator.onRefresh();
      await controller.addStream(
        Stream.fromIterable([
          initialState.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          initialState.copyWith(
            refreshStatus: RefreshStatus.success,
          ),
        ]),
      );
      verify(() => completer.complete()).called(1);
    });
  });
}
