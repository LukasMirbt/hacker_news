// ignore_for_file: prefer_const_constructors

import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

class _MockOtherUserThreadCommentModel extends Mock
    implements CurrentUserThreadCommentModel {}

void main() {
  final editUrl = Uri.parse('editUrl');

  group(EditOption, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;
    late CurrentUserThreadCommentModel comment;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      state = _MockThreadCommentOptionsState();
      comment = _MockOtherUserThreadCommentModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.comment).thenReturn(comment);
    });

    Widget buildSubject() {
      return Provider.value(
        value: comment,
        child: EditOption(),
      );
    }

    testWidgets('renders $EditOptionBody when editUrl '
        'is non-null', (tester) async {
      when(() => comment.editUrl).thenReturn(editUrl);
      await tester.pumpApp(buildSubject());
      expect(find.byType(EditOptionBody), findsOneWidget);
    });

    testWidgets('does not render $EditOptionBody when editUrl '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(EditOptionBody), findsNothing);
    });
  });
}
