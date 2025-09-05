// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reply_repository/reply_repository.dart';

part 'reply.freezed.dart';

@freezed
class Reply with _$Reply {
  const Reply({
    required this.id,
    required this.parentId,
    required this.indent,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.replyUrl,
    required this.score,
    required this.editUrl,
    required this.deleteUrl,
  });

  factory Reply.from({
    required String parentId,
    required CurrentUserCommentData comment,
  }) {
    final base = comment.base;

    return Reply(
      id: base.id,
      parentId: parentId,
      indent: base.indent + 1,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      replyUrl: base.replyUrl,
      score: comment.score,
      editUrl: comment.editUrl,
      deleteUrl: comment.deleteUrl,
    );
  }

  final String id;
  final String parentId;
  final int indent;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String? replyUrl;
  final int score;
  final String? editUrl;
  final String? deleteUrl;
}
