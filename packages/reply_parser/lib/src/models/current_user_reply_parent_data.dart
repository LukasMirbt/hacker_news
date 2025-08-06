part of 'reply_parent_data.dart';

class CurrentUserReplyParentData extends ReplyParentData {
  const CurrentUserReplyParentData({
    required super.base,
    required this.score,
  });

  factory CurrentUserReplyParentData.fromParsed({
    required BaseReplyParentData base,
    required int? score,
  }) {
    return CurrentUserReplyParentData(
      base: base,
      score: score ?? 0,
    );
  }

  final int score;

  @override
  List<Object?> get props => [
    ...super.props,
    score,
  ];
}
