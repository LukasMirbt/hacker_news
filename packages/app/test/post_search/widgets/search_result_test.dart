// ignore_for_file: prefer_const_constructors

import 'package:app/post_search/post_search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockPostSearchBloc extends MockBloc<PostSearchEvent, PostSearchState>
    implements PostSearchBloc {}

class _MockSearchResultModel extends Mock implements SearchResultModel {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  const user = 'user';

  const snippet = SearchResultSnippet(
    text: 'text',
    match: SearchMatch(
      start: 0,
      end: 0,
      isStartOfText: false,
      isEndOfText: false,
    ),
  );

  group(SearchResult, () {
    late PostSearchBloc bloc;
    late SearchResultModel item;
    late GoRouter goRouter;

    setUp(() {
      bloc = _MockPostSearchBloc();
      item = _MockSearchResultModel();
      goRouter = _MockGoRouter();
      when(() => item.user).thenReturn(user);
      when(() => item.snippet).thenReturn(snippet);
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: BlocProvider.value(
          value: bloc,
          child: Provider.value(
            value: item,
            child: SearchResult(),
          ),
        ),
      );
    }

    testWidgets('adds $PostSearchItemPressed and pops '
        'when $InkWell is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(InkWell));
      verify(
        () => bloc.add(
          PostSearchItemPressed(item),
        ),
      ).called(1);
      verify(goRouter.pop).called(1);
    });

    testWidgets('renders user', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(user), findsOneWidget);
    });

    testWidgets('renders $SearchResultText', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SearchResultText), findsOneWidget);
    });
  });
}
