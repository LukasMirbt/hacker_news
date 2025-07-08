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
    return DetailSubtitleRowData(
      score: score ?? 0,
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
      commentCount: commentCount ?? 0,
    );
  }

  static final empty = DetailSubtitleRowData(
    score: 0,
    hnuser: Hnuser.empty,
    age: DateTime(0),
    commentCount: 0,
  );

  final int score;
  final Hnuser hnuser;
  final DateTime age;
  final int commentCount;

  @override
  List<Object> get props => [
    score,
    hnuser,
    age,
    commentCount,
  ];
}
