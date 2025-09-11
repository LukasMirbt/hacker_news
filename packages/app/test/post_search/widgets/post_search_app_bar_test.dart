// ignore_for_file: prefer_const_constructors

import 'package:app/post/post.dart';
import 'package:app/post_search/post_search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockPostSearchBloc extends MockBloc<PostSearchEvent, PostSearchState>
    implements PostSearchBloc {}

void main() {
  group(PostSearchAppBar, () {
    late PostSearchBloc bloc;

    setUp(() {
      bloc = _MockPostSearchBloc();
      when(() => bloc.state).thenReturn(
        PostSearchState.initial(
          query: '',
          comments: [],
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostSearchAppBar(),
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

      testWidgets('has correct titleSpacing', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.titleSpacing, 0);
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.title, isA<PostSearchBar>());
      });
    });
  });
}
