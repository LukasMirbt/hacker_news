import 'package:post_parser/post_parser.dart';

class DetailCommentFormParser {
  const DetailCommentFormParser({
    ParentParser? parentParser,
    GotoParser? gotoParser,
    HmacParser? hmacParser,
  }) : _parentParser = parentParser ?? const ParentParser(),
       _gotoParser = gotoParser ?? const GotoParser(),
       _hmacParser = hmacParser ?? const HmacParser();

  final ParentParser _parentParser;
  final GotoParser _gotoParser;
  final HmacParser _hmacParser;

  DetailCommentFormData parse(Element fatItem) {
    final parent = _parentParser.parse(fatItem);
    final goto = _gotoParser.parse(fatItem);
    final hmac = _hmacParser.parse(fatItem);

    return DetailCommentFormData.fromParsed(
      parent: parent,
      goto: goto,
      hmac: hmac,
    );
  }
}
