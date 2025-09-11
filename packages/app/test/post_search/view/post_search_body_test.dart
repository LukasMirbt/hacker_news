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
  final items = List.filled(
    10,
    SearchResultModel(
      comment: OtherUserCommentPlaceholder(),
      snippet: SearchResultSnippet(
        text: '',
        match: SearchMatch(
          start: 0,
          end: 0,
          isStartOfText: false,
          isEndOfText: false,
        ),
      ),
    ),
  );

  group(PostSearchBody, () {
    late PostSearchBloc bloc;
    late PostSearchState state;
    late SearchResultListModel resultList;

    setUp(() {
      bloc = _MockPostSearchBloc();
      state = _MockPostSearchState();
      resultList = _MockSearchResultListModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.resultList).thenReturn(resultList);
      when(() => resultList.items).thenReturn(items);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostSearchBody(),
      );
    }

    group(ListView, () {
      Future<Widget? Function(BuildContext, int)> findBuilder(
        WidgetTester tester,
      ) async {
        await tester.pumpApp(buildSubject());
        final widget = tester.widget<ListView>(find.byType(ListView));
        final delegate = widget.childrenDelegate as SliverChildBuilderDelegate;
        return delegate.builder;
      }

      testWidgets('itemBuilder renders $SearchResult', (tester) async {
        final builder = await findBuilder(tester);
        await tester.pumpApp(
          Builder(
            builder: (context) => builder(context, 1)!,
          ),
        );
        expect(find.byType(SearchResult), findsOneWidget);
      });

      testWidgets('itemBuilder renders $Divider', (tester) async {
        final builder = await findBuilder(tester);
        await tester.pumpApp(
          Builder(
            builder: (context) => builder(context, 1)!,
          ),
        );
        expect(
          find.byWidgetPredicate(
            (widget) => widget is Divider && widget.height == 1,
          ),
          findsOneWidget,
        );
      });

      testWidgets('itemBuilder renders $SafeArea '
          'when isLast', (tester) async {
        final index = items.length - 1;
        final builder = await findBuilder(tester);
        await tester.pumpApp(
          Builder(
            builder: (context) => builder(context, index)!,
          ),
        );
        expect(find.byType(SafeArea), findsOneWidget);
      });
    });
  });
}
