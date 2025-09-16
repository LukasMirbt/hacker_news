// ignore_for_file: prefer_const_constructors

import 'package:app/post/post.dart';
import 'package:app/post_header/post_header.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockScrollController extends Mock implements ScrollController {}

void main() {
  group(PostAppBar, () {
    late PostHeaderBloc bloc;
    late ScrollController controller;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      controller = _MockScrollController();
      when(() => bloc.state).thenReturn(
        PostHeaderState.initial(
          id: '',
          visitedPosts: {},
        ),
      );
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

      testWidgets('has correct title', (tester) async {
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
