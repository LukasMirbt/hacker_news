import 'package:visited_post_storage/visited_post_storage.dart';

class VisitedPostDataPlaceholder extends VisitedPostData {
  VisitedPostDataPlaceholder({
    String? postId,
    DateTime? createdAt,
  }) : super(
         postId: postId ?? 'postId',
         createdAt: createdAt ?? DateTime(1),
       );
}
