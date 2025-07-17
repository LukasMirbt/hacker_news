// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread_repository/thread_repository.dart';

part 'thread_comment.freezed.dart';

@freezed
class ThreadComment with _$ThreadComment {
  const ThreadComment({
    required this.id,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.indent,
    required this.score,
    required this.hasBeenUpvoted,
    required this.parentUrl,
    required this.contextUrl,
  });

  factory ThreadComment.from(ThreadCommentData data) {
    return ThreadComment(
      id: data.id,
      hnuser: data.hnuser,
      age: data.age,
      htmlText: data.htmlText,
      indent: data.indent,
      score: data.score,
      hasBeenUpvoted: data.hasBeenUpvoted,
      parentUrl: data.parentUrl,
      contextUrl: data.contextUrl,
    );
  }

  final String id;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final int indent;
  final int? score;
  final bool? hasBeenUpvoted;
  final String? parentUrl;
  final String? contextUrl;

  ThreadComment upvote() => copyWith(hasBeenUpvoted: true);

  ThreadComment unvote() => copyWith(hasBeenUpvoted: false);
}
