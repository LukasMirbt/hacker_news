// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../pump_post.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

class _MockPostState extends Mock implements PostState {}

void main() {
  const id = 'id';

  group(PostOptionsButton, () {
    late PostBloc bloc;
    late PostState state;

    setUp(() {
      bloc = _MockPostBloc();
      state = _MockPostState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.id).thenReturn(id);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: PostOptionsButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('shows $PostOptionsSheet when $IconButton '
        'is pressed', (tester) async {
      await tester.pumpPost(buildSubject());
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(
        find.byType(PostOptionsSheet),
        findsOneWidget,
      );
    });
  });
}
