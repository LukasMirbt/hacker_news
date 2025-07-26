import 'package:post_repository/post_repository.dart';

class PostPlaceholder extends Post {
  PostPlaceholder({
    PostHeader? header,
    List<Comment>? comments,
  }) : super(
         header: header ?? PostHeaderPlaceholder(),
         comments: comments ?? const [],
       );
}
