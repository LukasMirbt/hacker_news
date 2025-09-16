// ignore_for_file: prefer_const_constructors

import 'package:app/post/post.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

class _MockScrollController extends Mock implements ScrollController {}

void main() {
  final initialState = PostState(
    id: 'id',
    fetchStatus: FetchStatus.loading,
    refreshStatus: RefreshStatus.initial,
    post: PostPlaceholder(),
  );

  group(PostAppBar, () {
    late PostBloc bloc;
    late ScrollController controller;

    setUp(() {
      bloc = _MockPostBloc();
      controller = _MockScrollController();
      when(() => bloc.state).thenReturn(initialState);
      when(() => controller.offset).thenReturn(0);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: InheritedProvider.value(
          value: controller,
          child: PostAppBar(),
        ),
      );
    }

    testWidgets('renders $Hero with correct tag', (tester) async {
      await tester.pumpApp(buildSubject());
      final hero = tester.widget<Hero>(
        find.byType(Hero),
      );
      expect(hero.tag, PostAppBar.heroTag);
    });

    group(AppBar, () {
      AppBar findWidget(WidgetTester tester) {
        return tester.widget<AppBar>(
          find.byType(AppBar),
        );
      }

      testWidgets('has correct leading', (tester) async {
        await tester.pumpApp(buildSubject());
        final appBar = findWidget(tester);
        expect(appBar.leading, isA<PostBackButton>());
      });

      testWidgets('has correct title '
          'when isFailure', (tester) async {
        when(() => bloc.state).thenReturn(
          initialState.copyWith(
            fetchStatus: FetchStatus.failure,
          ),
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.title, null);
      });

      testWidgets('has correct title '
          'when !isFailure', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<PostAppBarTitle>(),
        );
      });

      testWidgets('has correct actions', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.actions,
          [
            isA<PostSearchButton>(),
          ],
        );
      });
    });
  });
}
