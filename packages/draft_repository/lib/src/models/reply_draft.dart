// ignore_for_file: annotate_overrides

part of 'draft.dart';

@freezed
class ReplyDraft extends Draft with _$ReplyDraft {
  const ReplyDraft({
    required this.id,
    required this.createdAt,
    required this.draft,
    required this.url,
    required this.parentUser,
    required this.parentText,
  });

  factory ReplyDraft.from(ReplyDraft data) {
    return ReplyDraft(
      id: data.id,
      createdAt: data.createdAt,
      draft: data.draft,
      url: data.url,
      parentUser: data.parentUser,
      parentText: data.parentText,
    );
  }

  final String id;
  final DateTime createdAt;
  final String draft;
  final String url;
  final String parentUser;
  final String parentText;
}
