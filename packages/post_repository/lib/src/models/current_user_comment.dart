// ignore_for_file: annotate_overrides

part of 'comment.dart';

@freezed
class CurrentUserComment extends Comment with _$CurrentUserComment {
  const CurrentUserComment({
    required this.id,
    required this.indent,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.replyUrl,
    required this.score,
    required this.editUrl,
    required this.deleteUrl,
  });

  factory CurrentUserComment.from(CurrentUserCommentData data) {
    final base = data.base;

    return CurrentUserComment(
      id: base.id,
      indent: base.indent,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      replyUrl: base.replyUrl,
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
  final int score;
  final String? editUrl;
  final String? deleteUrl;
}
