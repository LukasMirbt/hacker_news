// ignore_for_file: prefer_const_constructors

import 'package:app/comment_options/comment_options.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockCommentOptionsBloc
    extends MockBloc<CommentOptionsEvent, CommentOptionsState>
    implements CommentOptionsBloc {}

class _MockCommentOptionsState extends Mock implements CommentOptionsState {}

class _MockOtherUserCommentModel extends Mock
    implements CurrentUserCommentModel {}

void main() {
  final deleteUrl = Uri.parse('deleteUrl');

  group(DeleteOption, () {
    late CommentOptionsBloc bloc;
    late CommentOptionsState state;
    late CurrentUserCommentModel comment;

    setUp(() {
      bloc = _MockCommentOptionsBloc();
      state = _MockCommentOptionsState();
      comment = _MockOtherUserCommentModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.comment).thenReturn(comment);
    });

    Widget buildSubject() {
      return Provider.value(
        value: comment,
        child: DeleteOption(),
      );
    }

    testWidgets('renders $DeleteOptionBody when deleteUrl '
        'is non-null', (tester) async {
      when(() => comment.deleteUrl).thenReturn(deleteUrl);
      await tester.pumpApp(buildSubject());
      expect(find.byType(DeleteOptionBody), findsOneWidget);
    });

    testWidgets('does not render $DeleteOptionBody when deleteUrl '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(DeleteOptionBody), findsNothing);
    });
  });
}
