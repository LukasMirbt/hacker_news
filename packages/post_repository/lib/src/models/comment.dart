// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const Comment({
    required this.id,
    required this.indent,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.hnuser,
    required this.age,
    required this.htmlText,
  });

  factory Comment.from(CommentData data) {
    return Comment(
      id: data.id,
      indent: data.indent,
      upvoteUrl: data.upvoteUrl,
      hasBeenUpvoted: data.hasBeenUpvoted,
      hnuser: data.hnuser,
      age: data.age,
      htmlText: data.htmlText,
    );
  }

  final String id;
  final int indent;
  final String upvoteUrl;
  final bool hasBeenUpvoted;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;

  Comment upvote() => copyWith(hasBeenUpvoted: true);

  Comment unvote() => copyWith(hasBeenUpvoted: false);
}
