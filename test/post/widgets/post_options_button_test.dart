// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/post/post.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

class _MockPostState extends Mock implements PostState {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  const id = 'id';

  group(PostOptionsButton, () {
    late PostBloc bloc;
    late PostState state;
    late GoRouter router;

    setUp(() {
      bloc = _MockPostBloc();
      state = _MockPostState();
      router = _MockGoRouter();
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

    testWidgets('navigates to $PostOptionsRoute when $IconButton '
        'is pressed', (tester) async {
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      await tester.tap(find.byType(IconButton));
      final route = PostOptionsRoute(postId: id);
      verify(
        () => router.go(route.location),
      ).called(1);
    });
  });
}
