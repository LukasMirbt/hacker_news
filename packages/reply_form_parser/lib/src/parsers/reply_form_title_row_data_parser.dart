import 'package:reply_form_parser/reply_form_parser.dart';

class ReplyFormTitleRowDataParser {
  const ReplyFormTitleRowDataParser({
    IdParser? idParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
  }) : _idParser = idParser ?? const IdParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser();

  final IdParser _idParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;

  ReplyFormTitleRowData parse(Element athing) {
    final id = _idParser.parse(athing);
    final hnuser = _hnuserParser.parse(athing);
    final age = _ageParser.parse(athing);

    return ReplyFormTitleRowData.fromParsed(
      id: id,
      hnuser: hnuser,
      age: age,
    );
  }
}
