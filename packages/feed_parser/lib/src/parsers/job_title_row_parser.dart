import 'package:feed_parser/feed_parser.dart';

class JobTitleRowParser {
  const JobTitleRowParser({
    BaseTitleRowParser? baseTitleRowParser,
  }) : _baseParser = baseTitleRowParser ?? const BaseTitleRowParser();

  final BaseTitleRowParser _baseParser;

  JobTitleRowData parse(Element athing) {
    final base = _baseParser.parse(athing);
    return JobTitleRowData(base: base);
  }
}
