// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

class _MockCommentState extends Mock implements CommentState {}

class _MockCommentPostModel extends Mock implements CommentPostModel {}

void main() {
  const title = 'title';

  group(CommentTitle, () {
    late CommentBloc bloc;
    late CommentState state;
    late CommentPostModel post;

    setUp(() {
      bloc = _MockCommentBloc();
      state = _MockCommentState();
      post = _MockCommentPostModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.post).thenReturn(post);
      when(() => post.title).thenReturn(title);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentTitle(),
      );
    }

    testWidgets('renders correct text', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(title), findsOneWidget);
    });
  });
}
