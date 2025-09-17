// ignore_for_file: prefer_const_constructors

import 'package:app/post_search/post_search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
      when(() => resultList.query).thenReturn('');
      when(() => resultList.items).thenReturn([]);
      when(() => resultList.isEmpty).thenReturn(false);
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

    testWidgets('renders $PostSearchEmptyBody '
        'when isEmpty', (tester) async {
      when(() => resultList.isEmpty).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchEmptyBody), findsOneWidget);
    });

    testWidgets('renders $PostSearchBody '
        'when !isEmpty', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchBody), findsOneWidget);
    });
  });
}
