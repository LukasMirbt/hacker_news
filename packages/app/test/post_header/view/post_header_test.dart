// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/post/post.dart';
import 'package:app/post_header/post_header.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../post/pump_post.dart';

class _MockPostBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

class _MockPostState extends Mock implements PostState {}

void main() {
  group(PostHeader, () {
    late PostBloc postBloc;
    late PostState postState;

    setUp(() {
      postBloc = _MockPostBloc();
      postState = _MockPostState();
      when(() => postBloc.state).thenReturn(postState);
      when(() => postState.id).thenReturn('id');
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: postBloc,
        child: PostHeader(),
      );
    }

    testWidgets('renders $PostHeaderView', (tester) async {
      await tester.pumpPost(buildSubject());
      expect(find.byType(PostHeaderView), findsOneWidget);
    });
  });
}
