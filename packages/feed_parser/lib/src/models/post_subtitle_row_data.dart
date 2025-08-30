part of 'subtitle_row_data.dart';

class PostSubtitleRowData extends SubtitleRowData {
  const PostSubtitleRowData({
    required this.score,
    required this.hnuser,
    required this.commentCount,
    required super.age,
  });

  factory PostSubtitleRowData.fromParsed({
    required int? score,
    required Hnuser? hnuser,
    required int? commentCount,
    required DateTime? age,
  }) {
    return PostSubtitleRowData(
      score: score ?? 0,
      hnuser: hnuser ?? Hnuser.empty,
      commentCount: commentCount ?? 0,
      age: age ?? DateTime(0),
    );
  }

  static final empty = PostSubtitleRowData(
    age: DateTime(0),
    score: 0,
    hnuser: Hnuser.empty,
    commentCount: 0,
  );

  final int score;
  final Hnuser hnuser;
  final int commentCount;

  @override
  List<Object?> get props => [
    score,
    hnuser,
    commentCount,
    ...super.props,
  ];
}
