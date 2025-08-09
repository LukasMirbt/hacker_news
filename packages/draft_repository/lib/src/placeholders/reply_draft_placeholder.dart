import 'package:draft_repository/draft_repository.dart';

class ReplyDraftPlaceholder extends ReplyDraft {
  ReplyDraftPlaceholder({
    int? id,
    DateTime? updatedAt,
    String? content,
    String? parentId,
    String? url,
    String? parentUserId,
    String? parentHtmlText,
  }) : super(
         id: id ?? 1,
         updatedAt: updatedAt ?? DateTime(1),
         content: content ?? 'content',
         parentId: parentId ?? 'parentId',
         url: url ?? 'url',
         parentUserId: parentUserId ?? 'parentUserId',
         parentHtmlText: parentHtmlText ?? 'parentHtmlText',
       );
}
