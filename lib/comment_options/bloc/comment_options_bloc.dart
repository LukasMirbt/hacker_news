import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';

class CommentOptionsBloc extends Bloc<void, CommentOptionsState> {
  CommentOptionsBloc({
    required Comment comment,
  }) : super(
         CommentOptionsState.from(comment: comment),
       );
}
