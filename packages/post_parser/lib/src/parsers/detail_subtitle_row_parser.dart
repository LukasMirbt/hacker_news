import 'package:post_parser/post_parser.dart';

class DetailSubtitleRowParser {
  const DetailSubtitleRowParser({
    ScoreParser? scoreParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentCountParser? commentCountParser,
  }) : _scoreParser = scoreParser ?? const ScoreParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _commentCountParser = commentCountParser ?? const CommentCountParser();

  final ScoreParser _scoreParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentCountParser _commentCountParser;

  DetailSubtitleRowData parse(Element subtext) {
    final score = _scoreParser.parse(subtext);
    final hnuser = _hnuserParser.parse(subtext);
    final age = _ageParser.parse(subtext);
    final commentCount = _commentCountParser.parse(subtext);

    return DetailSubtitleRowData.fromParsed(
      score: score,
      hnuser: hnuser,
      age: age,
      commentCount: commentCount,
    );
  }
}
