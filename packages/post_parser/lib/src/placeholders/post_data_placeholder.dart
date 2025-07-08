import 'package:post_parser/post_parser.dart';

class PostDataPlaceholder extends PostData {
  PostDataPlaceholder({
    DetailFatItemData? fatItemData,
    List<CommentData>? comments,
  }) : super(
         fatItemData: fatItemData ?? DetailFatItemDataPlaceholder(),
         comments: comments ?? [],
       );
}
