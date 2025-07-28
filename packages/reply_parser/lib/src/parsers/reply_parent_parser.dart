import 'package:reply_parser/reply_parser.dart';

class ReplyParentParser {
  const ReplyParentParser({
    IdParser? idParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
  }) : _idParser = idParser ?? const IdParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _htmlTextParser = commentHtmlTextParser ?? const CommentHtmlTextParser();

  final IdParser _idParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _htmlTextParser;

  ReplyParentData parse(Element athing) {
    final id = _idParser.parse(athing);
    final upvoteUrl = _upvoteUrlParser.parse(athing);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);
    final hnuser = _hnuserParser.parse(athing);
    final age = _ageParser.parse(athing);
    final htmlText = _htmlTextParser.parse(athing);

    return ReplyParentData.fromParsed(
      id: id,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
    );
  }
}
