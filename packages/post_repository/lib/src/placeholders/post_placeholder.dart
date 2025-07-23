import 'package:post_repository/post_repository.dart';

class PostPlaceholder extends Post {
  PostPlaceholder({
    PostHeader? header,
    CommentForm? commentForm,
    List<Comment>? comments,
  }) : super(
         header: header ?? PostHeaderPlaceholder(),
         commentForm: commentForm ?? const CommentFormPlaceholder(),
         comments: comments ?? const [],
       );
}
