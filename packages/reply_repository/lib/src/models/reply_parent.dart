// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reply_repository/reply_repository.dart';

part 'reply_parent.freezed.dart';

@freezed
class ReplyParent with _$ReplyParent {
  const ReplyParent({
    required this.id,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.hnuser,
    required this.age,
    required this.htmlText,
  });

  factory ReplyParent.from(ReplyParentData data) {
    return ReplyParent(
      id: data.id,
      upvoteUrl: data.upvoteUrl,
      hasBeenUpvoted: data.hasBeenUpvoted,
      hnuser: data.hnuser,
      age: data.age,
      htmlText: data.htmlText,
    );
  }

  static final empty = ReplyParent(
    id: '',
    upvoteUrl: '',
    hasBeenUpvoted: false,
    hnuser: Hnuser.empty,
    age: DateTime(0),
    htmlText: '',
  );

  final String id;
  final String upvoteUrl;
  final bool hasBeenUpvoted;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;

  ReplyParent upvote() => copyWith(hasBeenUpvoted: true);

  ReplyParent unvote() => copyWith(hasBeenUpvoted: false);
}
