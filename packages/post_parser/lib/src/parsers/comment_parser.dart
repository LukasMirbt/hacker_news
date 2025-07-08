import 'package:post_parser/post_parser.dart';

class CommentParser {
  const CommentParser({
    IdParser? idParser,
    IndentParser? indentParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
  }) : _idParser = idParser ?? const IdParser(),
       _indentParser = indentParser ?? const IndentParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _commentHtmlTextParser =
           commentHtmlTextParser ?? const CommentHtmlTextParser();

  final IdParser _idParser;
  final IndentParser _indentParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _commentHtmlTextParser;

  CommentData parse(Element element) {
    final id = _idParser.parse(element);
    final indent = _indentParser.parse(element);
    final upvoteUrl = _upvoteUrlParser.parse(element);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(element);
    final hnuser = _hnuserParser.parse(element);
    final age = _ageParser.parse(element);
    final htmlText = _commentHtmlTextParser.parse(element);

    return CommentData.fromParsed(
      id: id,
      indent: indent,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
    );
  }
}
