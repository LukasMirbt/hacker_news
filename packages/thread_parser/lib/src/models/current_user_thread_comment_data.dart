part of 'thread_comment_data.dart';

class CurrentUserThreadCommentData extends ThreadCommentData {
  const CurrentUserThreadCommentData({
    required super.base,
    required this.score,
  });

  factory CurrentUserThreadCommentData.fromParsed({
    required BaseThreadCommentData base,
    required int? score,
  }) {
    return CurrentUserThreadCommentData(
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
