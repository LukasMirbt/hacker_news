// ignore_for_file: annotate_overrides

part of 'comment.dart';

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
    final base = data.base;

    return OtherUserComment(
      id: base.id,
      indent: base.indent,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      replyUrl: base.replyUrl,
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
