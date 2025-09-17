// ignore_for_file: prefer_const_constructors

import 'package:app/post_search/post_search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockPostSearchBloc extends MockBloc<PostSearchEvent, PostSearchState>
    implements PostSearchBloc {}

class _MockPostSearchState extends Mock implements PostSearchState {}

class _MockSearchResultListModel extends Mock
    implements SearchResultListModel {}

void main() {
  group(PostSearchView, () {
    late PostSearchBloc bloc;
    late PostSearchState state;
    late SearchResultListModel resultList;

    setUp(() {
      bloc = _MockPostSearchBloc();
      state = _MockPostSearchState();
      resultList = _MockSearchResultListModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.resultList).thenReturn(resultList);
      when(() => resultList.query).thenReturn('query');
      when(() => resultList.items).thenReturn([]);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostSearchView(),
      );
    }

    testWidgets('renders $PostSearchAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchAppBar), findsOneWidget);
    });

    testWidgets('does not render $PostSearchBody '
        'or $PostSearchEmptyBody when query.isEmpty', (tester) async {
      when(() => resultList.query).thenReturn('');
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchBody), findsNothing);
      expect(find.byType(PostSearchEmptyBody), findsNothing);
    });

    testWidgets('renders $PostSearchEmptyBody '
        'when items.isEmpty', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchEmptyBody), findsOneWidget);
    });

    testWidgets('renders $PostSearchBody '
        'when !items.isEmpty', (tester) async {
      when(() => resultList.items).thenReturn([
        SearchResultModel(
          snippet: SearchResultSnippet(
            text: '',
            match: SearchMatch(
              start: 0,
              end: 0,
              isStartOfText: false,
              isEndOfText: false,
            ),
          ),
          comment: OtherUserCommentPlaceholder(),
        ),
      ]);
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchBody), findsOneWidget);
    });
  });
}
