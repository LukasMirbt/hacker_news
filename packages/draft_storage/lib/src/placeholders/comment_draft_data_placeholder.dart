import 'package:draft_storage/draft_storage.dart';

class CommentDraftDataPlaceholder extends CommentDraftData {
  CommentDraftDataPlaceholder({
    int? id,
    String? userId,
    String? parentId,
    DateTime? updatedAt,
    String? postTitle,
    String? content,
  }) : super(
         id: id ?? 1,
         userId: userId ?? 'userId',
         parentId: parentId ?? 'parentId',
         updatedAt: updatedAt ?? DateTime(1),
         postTitle: postTitle ?? 'postTitle',
         content: content ?? 'content',
       );
}
