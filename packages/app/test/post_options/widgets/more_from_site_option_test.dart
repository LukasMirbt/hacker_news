// ignore_for_file: prefer_const_constructors

import 'package:app/post_options/post_options.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockPostOptionsBloc extends MockBloc<void, PostOptionsState>
    implements PostOptionsBloc {}

class _MockPostOptionsState extends Mock implements PostOptionsState {}

class _MockPostModel extends Mock implements PostModel {}

void main() {
  const urlHost = 'urlHost';

  group(MoreFromSiteOption, () {
    late PostOptionsBloc bloc;
    late PostOptionsState state;
    late PostModel post;

    setUp(() {
      bloc = _MockPostOptionsBloc();
      state = _MockPostOptionsState();
      post = _MockPostModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.post).thenReturn(post);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: MoreFromSiteOption(),
      );
    }

    testWidgets('renders $MoreFromSiteOptionBody when urlHost '
        'is non-null', (tester) async {
      when(() => post.urlHost).thenReturn(urlHost);
      await tester.pumpApp(buildSubject());
      expect(find.byType(MoreFromSiteOptionBody), findsOneWidget);
    });

    testWidgets('does not render $MoreFromSiteOptionBody when urlHost '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(MoreFromSiteOptionBody), findsNothing);
    });
  });
}
