import 'package:draft_storage/draft_storage.dart';

class ReplyDraftDataPlaceholder extends ReplyDraftData {
  ReplyDraftDataPlaceholder({
    int? id,
    String? userId,
    String? parentId,
    DateTime? updatedAt,
    String? url,
    String? parentUserId,
    String? parentHtmlText,
    String? content,
  }) : super(
         id: id ?? 1,
         userId: userId ?? 'userId',
         parentId: parentId ?? 'parentId',
         updatedAt: updatedAt ?? DateTime(1),
         url: url ?? 'url',
         parentUserId: parentUserId ?? 'parentUserId',
         parentHtmlText: parentHtmlText ?? 'parentHtmlText',
         content: content ?? 'content',
       );
}
