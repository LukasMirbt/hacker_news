// ignore_for_file: annotate_overrides

part of 'reply_parent.dart';

@freezed
class CurrentUserReplyParent extends ReplyParent with _$CurrentUserReplyParent {
  const CurrentUserReplyParent({
    required this.id,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.score,
  });

  factory CurrentUserReplyParent.from(CurrentUserReplyParentData data) {
    final base = data.base;

    return CurrentUserReplyParent(
      id: base.id,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      score: data.score,
    );
  }

  final String id;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final int score;
}
