// ignore_for_file: annotate_overrides, overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'comment.freezed.dart';

sealed class Comment {
  const Comment();

  factory Comment.from(CommentData data) {
    return switch (data) {
      final CurrentUserCommentData data => CurrentUserComment.from(data),
      final OtherUserCommentData data => OtherUserComment.from(data),
    };
  }

  String get id;
  int get indent;
  Hnuser get hnuser;
  DateTime get age;
  String get htmlText;
  String? get replyUrl;
}

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
  });

  factory CurrentUserComment.from(CurrentUserCommentData data) {
    return CurrentUserComment(
      id: data.base.id,
      indent: data.base.indent,
      hnuser: data.base.hnuser,
      age: data.base.age,
      htmlText: data.base.htmlText,
      replyUrl: data.base.replyUrl,
      score: data.score,
    );
  }

  final String id;
  final int indent;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String? replyUrl;
  final int score;
}

@freezed
class OtherUserComment extends Comment with _$OtherUserComment {
  const OtherUserComment({
    required this.id,
    required this.indent,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.replyUrl,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
  });

  factory OtherUserComment.from(OtherUserCommentData data) {
    return OtherUserComment(
      id: data.base.id,
      indent: data.base.indent,
      hnuser: data.base.hnuser,
      age: data.base.age,
      htmlText: data.base.htmlText,
      replyUrl: data.base.replyUrl,
      upvoteUrl: data.upvoteUrl,
      hasBeenUpvoted: data.hasBeenUpvoted,
    );
  }

  final String id;
  final int indent;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String? replyUrl;
  final String upvoteUrl;
  final bool hasBeenUpvoted;

  OtherUserComment upvote() => copyWith(hasBeenUpvoted: true);
  OtherUserComment unvote() => copyWith(hasBeenUpvoted: false);
}
