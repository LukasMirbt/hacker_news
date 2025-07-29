// ignore_for_file: annotate_overrides

part of 'thread_comment.dart';

@freezed
class OtherUserThreadComment extends ThreadComment
    with _$OtherUserThreadComment {
  const OtherUserThreadComment({
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
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
  });

  factory OtherUserThreadComment.from(OtherUserThreadCommentData data) {
    final base = data.base;

    return OtherUserThreadComment(
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
  final String? parentUrl;
  final String? contextUrl;
  final String? onUrl;
  final String? onTitle;
  final String upvoteUrl;
  final bool hasBeenUpvoted;

  OtherUserThreadComment upvote() => copyWith(hasBeenUpvoted: true);

  OtherUserThreadComment unvote() => copyWith(hasBeenUpvoted: false);
}
