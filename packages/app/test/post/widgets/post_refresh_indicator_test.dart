// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:app/post/post.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

class _MockCompleter extends Mock implements Completer<void> {}

void main() {
  final child = Container();

  final initialState = PostState(
    id: 'id',
    fetchStatus: FetchStatus.loading,
    refreshStatus: RefreshStatus.initial,
  );

  group(PostRefreshIndicator, () {
    late PostBloc bloc;
    late Completer<void> completer;
    late StreamController<PostState> controller;

    setUp(() {
      bloc = _MockPostBloc();
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
        child: PostRefreshIndicator(
          child: child,
          createCompleter: () => completer,
        ),
      );
    }

    testWidgets('renders $RefreshIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(RefreshIndicator), findsOneWidget);
    });

    testWidgets('creates completer, adds $PostRefreshTriggered '
        'and returns completer.future', (tester) async {
      final future = Future<void>.value();
      when(() => completer.future).thenAnswer((_) => future);
      await tester.pumpApp(buildSubject());
      final refreshIndicator = tester.widget<RefreshIndicator>(
        find.byType(RefreshIndicator),
      );
      expect(refreshIndicator.onRefresh(), future);
      verify(() => bloc.add(PostRefreshTriggered())).called(1);
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
