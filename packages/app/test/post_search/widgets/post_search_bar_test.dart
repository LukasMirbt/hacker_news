// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
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

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const query = 'query';

  group(PostSearchBar, () {
    late PostSearchBloc bloc;
    late PostSearchState state;
    late SearchResultListModel resultList;

    setUp(() {
      bloc = _MockPostSearchBloc();
      state = _MockPostSearchState();
      resultList = _MockSearchResultListModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.resultList).thenReturn(resultList);
      when(() => resultList.query).thenReturn(query);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostSearchBar(),
      );
    }

    group(SearchBar, () {
      SearchBar findWidget(WidgetTester tester) {
        return tester.widget<SearchBar>(
          find.byType(SearchBar),
        );
      }

      testWidgets('has correct initial text', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.controller?.text, query);
      });

      testWidgets('autoFocus is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.autoFocus, true);
      });

      testWidgets('has correct hintText', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.hintText, l10n.postSearch_hintText);
      });

      testWidgets('adds $PostSearchQueryChanged onChanged', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        const query = 'query';
        widget.onChanged?.call(query);
        verify(
          () => bloc.add(
            PostSearchQueryChanged(query),
          ),
        ).called(1);
      });

      testWidgets('has correct trailing', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.trailing,
          [
            isA<PostSearchBarClearButton>(),
          ],
        );
      });
    });
  });
}
