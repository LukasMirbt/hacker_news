// ignore_for_file: annotate_overrides

part of 'thread_comment.dart';

@freezed
class CurrentUserThreadComment extends ThreadComment
    with _$CurrentUserThreadComment {
  const CurrentUserThreadComment({
    required this.id,
    required this.indent,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.replyUrl,
    required this.parentUrl,
    required this.contextUrl,
    required this.onUrl,
    required this.onTitle,
    required this.score,
    required this.editUrl,
    required this.deleteUrl,
  });

  factory CurrentUserThreadComment.from(CurrentUserThreadCommentData data) {
    final base = data.base;

    return CurrentUserThreadComment(
      id: base.id,
      indent: base.indent,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      replyUrl: base.replyUrl,
      parentUrl: base.parentUrl,
      contextUrl: base.contextUrl,
      onUrl: base.onUrl,
      onTitle: base.onTitle,
      score: data.score,
      editUrl: data.editUrl,
      deleteUrl: data.deleteUrl,
    );
  }

  final String id;
  final int indent;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String? replyUrl;
  final String? parentUrl;
  final String? contextUrl;
  final String? onUrl;
  final String? onTitle;
  final int score;
  final String? editUrl;
  final String? deleteUrl;
}
