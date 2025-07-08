import 'package:feed_parser/feed_parser.dart';

class RankParser extends ParserTemplate<int> {
  const RankParser();

  @override
  String? extractText(Element athing) {
    final rankElement = athing.querySelector('.rank');
    if (rankElement == null) return null;
    return rankElement.text;
  }

  @override
  int? parseText(String text) {
    final match = RegExp(r'^(\d+)').firstMatch(text);
    if (match == null) return null;

    final rankString = match.group(1);
    if (rankString == null) return null;

    final rank = int.tryParse(rankString);
    return rank;
  }
}
