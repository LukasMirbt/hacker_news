// ignore_for_file: annotate_overrides

part of 'draft.dart';

@freezed
class CommentDraft extends Draft with _$CommentDraft {
  const CommentDraft({
    required this.id,
    required this.updatedAt,
    required this.content,
    required this.parentId,
    required this.postTitle,
  });

  factory CommentDraft.from(CommentDraftData data) {
    return CommentDraft(
      id: data.id,
      updatedAt: data.updatedAt.toLocal(),
      content: data.content,
      parentId: data.parentId,
      postTitle: data.postTitle,
    );
  }

  final int id;
  final DateTime updatedAt;
  final String content;
  final String parentId;
  final String postTitle;
}
