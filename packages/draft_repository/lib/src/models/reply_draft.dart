// ignore_for_file: annotate_overrides

part of 'draft.dart';

@freezed
class ReplyDraft extends Draft with _$ReplyDraft {
  const ReplyDraft({
    required this.id,
    required this.updatedAt,
    required this.content,
    required this.parentId,
    required this.url,
    required this.parentHtmlText,
  });

  factory ReplyDraft.from(ReplyDraftData data) {
    return ReplyDraft(
      id: data.id,
      updatedAt: data.updatedAt.toLocal(),
      content: data.content,
      parentId: data.parentId,
      url: data.url,
      parentHtmlText: data.parentHtmlText,
    );
  }

  final int id;
  final DateTime updatedAt;
  final String content;
  final String parentId;
  final String url;
  final String parentHtmlText;
}
