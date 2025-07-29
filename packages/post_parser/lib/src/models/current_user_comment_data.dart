part of 'comment_data.dart';

class CurrentUserCommentData extends CommentData {
  const CurrentUserCommentData({
    required super.base,
    required this.score,
  });

  factory CurrentUserCommentData.fromParsed({
    required BaseCommentData base,
    required int? score,
  }) {
    return CurrentUserCommentData(
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
