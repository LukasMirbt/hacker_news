import 'package:equatable/equatable.dart';
import 'package:post_parser/post_parser.dart';

class DetailSubtitleRowData extends Equatable {
  const DetailSubtitleRowData({
    required this.score,
    required this.hnuser,
    required this.age,
    required this.commentCount,
  });

  factory DetailSubtitleRowData.fromParsed({
    required int? score,
    required Hnuser? hnuser,
    required DateTime? age,
    required int? commentCount,
  }) {
    final isJob = score == null && commentCount == null;

    return DetailSubtitleRowData(
      score: score,
      hnuser: hnuser,
      age: age ?? DateTime(0),
      commentCount: isJob ? null : (commentCount ?? 0),
    );
  }

  static final empty = DetailSubtitleRowData(
    age: DateTime(0),
    score: null,
    hnuser: null,
    commentCount: null,
  );

  final int? score;
  final Hnuser? hnuser;
  final DateTime age;
  final int? commentCount;

  @override
  List<Object?> get props => [
    score,
    hnuser,
    age,
    commentCount,
  ];
}
