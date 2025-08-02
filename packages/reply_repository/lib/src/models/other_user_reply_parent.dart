// ignore_for_file: annotate_overrides

part of 'reply_parent.dart';

@freezed
class OtherUserReplyParent extends ReplyParent with _$OtherUserReplyParent {
  const OtherUserReplyParent({
    required this.id,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
  });

  factory OtherUserReplyParent.from(OtherUserReplyParentData data) {
    final base = data.base;

    return OtherUserReplyParent(
      id: base.id,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      upvoteUrl: data.upvoteUrl,
      hasBeenUpvoted: data.hasBeenUpvoted,
    );
  }

  static final empty = OtherUserReplyParent(
    id: '',
    hnuser: Hnuser.empty,
    age: DateTime(0),
    htmlText: '',
    upvoteUrl: '',
    hasBeenUpvoted: false,
  );

  final String id;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String upvoteUrl;
  final bool hasBeenUpvoted;

  OtherUserReplyParent upvote() => copyWith(hasBeenUpvoted: true);

  OtherUserReplyParent unvote() => copyWith(hasBeenUpvoted: false);
}
