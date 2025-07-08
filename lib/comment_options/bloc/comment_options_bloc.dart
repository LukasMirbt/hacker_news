import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';

class CommentOptionsBloc extends Bloc<void, CommentOptionsState> {
  CommentOptionsBloc({
    required String commentId,
    required PostRepository postRepository,
  }) : super(
         CommentOptionsState.from(
           postId: postRepository.state.header.id,
           comments: postRepository.state.comments,
           commentId: commentId,
         ),
       );
}
