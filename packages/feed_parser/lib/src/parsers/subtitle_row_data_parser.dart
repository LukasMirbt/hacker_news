import 'package:feed_parser/feed_parser.dart';

class SubtitleRowDataParser {
  const SubtitleRowDataParser({
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

  SubtitleRowData parse(Element subtitleRow) {
    final score = _scoreParser.parse(subtitleRow);
    final hnuser = _hnuserParser.parse(subtitleRow);
    final age = _ageParser.parse(subtitleRow);
    final commentCount = _commentCountParser.parse(subtitleRow);

    return SubtitleRowData.fromParsed(
      score: score,
      hnuser: hnuser,
      age: age,
      commentCount: commentCount,
    );
  }
}
