import 'package:draft_repository/draft_repository.dart';

class CommentDraftPlaceholder extends CommentDraft {
  CommentDraftPlaceholder({
    int? id,
    DateTime? updatedAt,
    String? content,
    String? parentId,
    String? postTitle,
  }) : super(
         id: id ?? 1,
         updatedAt: updatedAt ?? DateTime(1),
         content: content ?? 'content',
         parentId: parentId ?? 'parentId',
         postTitle: postTitle ?? 'postTitle',
       );
}
