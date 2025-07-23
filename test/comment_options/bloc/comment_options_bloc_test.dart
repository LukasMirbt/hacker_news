// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_options/bloc/bloc.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  final comment = CommentPlaceholder();

  group(CommentOptionsBloc, () {
    CommentOptionsBloc buildBloc() {
      return CommentOptionsBloc(comment: comment);
    }

    test('initial state is $CommentOptionsState', () {
      expect(
        buildBloc().state,
        CommentOptionsState.from(comment: comment),
      );
    });
  });
}
