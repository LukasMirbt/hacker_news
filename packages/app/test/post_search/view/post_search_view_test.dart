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

void main() {
  group(PostSearchView, () {
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
        child: PostSearchView(),
      );
    }

    testWidgets('renders $PostSearchAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchAppBar), findsOneWidget);
    });

    testWidgets('renders $PostSearchBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(PostSearchBody), findsOneWidget);
    });
  });
}
