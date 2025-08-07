// ignore_for_file: annotate_overrides

part of 'draft.dart';

@freezed
class CommentDraft extends Draft with _$CommentDraft {
  const CommentDraft({
    required this.createdAt,
    required this.draft,
    required this.postId,
    required this.postUserId,
    required this.postTitle,
  });

  factory CommentDraft.from(CommentDraftData data) {
    return CommentDraft(
      createdAt: data.createdAt,
      draft: data.draft,
      postId: data.postId,
      postUserId: data.postUserId,
      postTitle: data.postTitle,
    );
  }

  final DateTime createdAt;
  final String draft;
  final String postId;
  final String postUserId;
  final String postTitle;
}
