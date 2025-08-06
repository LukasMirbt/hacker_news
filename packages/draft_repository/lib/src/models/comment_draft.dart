// ignore_for_file: annotate_overrides

part of 'draft.dart';

@freezed
class CommentDraft extends Draft with _$CommentDraft {
  const CommentDraft({
    required this.id,
    required this.createdAt,
    required this.draft,
    required this.postId,
    required this.postUser,
    required this.postTitle,
  });

  factory CommentDraft.from(CommentDraft data) {
    return CommentDraft(
      id: data.id,
      createdAt: data.createdAt,
      draft: data.draft,
      postId: data.postId,
      postUser: data.postUser,
      postTitle: data.postTitle,
    );
  }

  final String id;
  final DateTime createdAt;
  final String draft;
  final String postId;
  final String postUser;
  final String postTitle;
}
