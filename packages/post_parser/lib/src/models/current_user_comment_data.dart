part of 'comment_data.dart';

class CurrentUserCommentData extends CommentData {
  const CurrentUserCommentData({
    required this.score,
    required this.editUrl,
    required this.deleteUrl,
    required super.base,
  });

  factory CurrentUserCommentData.fromParsed({
    required BaseCommentData base,
    required int? score,
    required String? editUrl,
    required String? deleteUrl,
  }) {
    return CurrentUserCommentData(
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
