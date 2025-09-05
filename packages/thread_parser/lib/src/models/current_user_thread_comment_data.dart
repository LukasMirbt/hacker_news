part of 'thread_comment_data.dart';

class CurrentUserThreadCommentData extends ThreadCommentData {
  const CurrentUserThreadCommentData({
    required this.score,
    required this.editUrl,
    required this.deleteUrl,
    required super.base,
  });

  factory CurrentUserThreadCommentData.fromParsed({
    required BaseThreadCommentData base,
    required int? score,
    required String? editUrl,
    required String? deleteUrl,
  }) {
    return CurrentUserThreadCommentData(
      base: base,
      score: score ?? 0,
      editUrl: editUrl,
      deleteUrl: deleteUrl,
    );
  }

  final int score;
  final String? editUrl;
  final String? deleteUrl;

  @override
  List<Object?> get props => [
    score,
    editUrl,
    deleteUrl,
    ...super.props,
  ];
}
