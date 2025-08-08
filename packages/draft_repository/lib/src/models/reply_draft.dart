// ignore_for_file: annotate_overrides

part of 'draft.dart';

@freezed
class ReplyDraft extends Draft with _$ReplyDraft {
  const ReplyDraft({
    required this.id,
    required this.createdAt,
    required this.content,
    required this.parentId,
    required this.url,
    required this.parentUserId,
    required this.parentHtmlText,
  });

  factory ReplyDraft.from(ReplyDraftData data) {
    return ReplyDraft(
      id: data.id,
      createdAt: data.createdAt,
      content: data.content,
      parentId: data.parentId,
      url: data.url,
      parentUserId: data.parentUserId,
      parentHtmlText: data.parentHtmlText,
    );
  }

  final int id;
  final DateTime createdAt;
  final String content;
  final String parentId;
  final String url;
  final String parentUserId;
  final String parentHtmlText;
}
