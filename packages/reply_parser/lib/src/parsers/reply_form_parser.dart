import 'package:reply_parser/reply_parser.dart';

class ReplyFormParser {
  const ReplyFormParser({
    ParentParser? parentParser,
    GotoParser? gotoParser,
    HmacParser? hmacParser,
  }) : _parentParser = parentParser ?? const ParentParser(),
       _gotoParser = gotoParser ?? const GotoParser(),
       _hmacParser = hmacParser ?? const HmacParser();

  final ParentParser _parentParser;
  final GotoParser _gotoParser;
  final HmacParser _hmacParser;

  ReplyFormData parse(Element fatItem) {
    final parent = _parentParser.parse(fatItem);
    final goto = _gotoParser.parse(fatItem);
    final hmac = _hmacParser.parse(fatItem);

    return ReplyFormData.fromParsed(
      parent: parent,
      goto: goto,
      hmac: hmac,
    );
  }
}
