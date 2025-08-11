import 'package:draft_storage/draft_storage.dart';

class CommentDraftDataPlaceholder extends CommentDraftData {
  CommentDraftDataPlaceholder({
    int? id,
    String? userId,
    String? postId,
    DateTime? updatedAt,
    String? postUserId,
    String? postTitle,
    String? content,
  }) : super(
         id: id ?? 1,
         userId: userId ?? 'userId',
         postId: postId ?? 'postId',
         updatedAt: updatedAt ?? DateTime(1),
         postUserId: postUserId ?? 'postUserId',
         postTitle: postTitle ?? 'postTitle',
         content: content ?? 'content',
       );
}
