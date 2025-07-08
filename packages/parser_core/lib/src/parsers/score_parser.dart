import 'package:parser_core/parser_core.dart';

class ScoreParser extends ParserTemplate<int> {
  const ScoreParser();

  @override
  String? extractText(Element element) {
    final scoreElement = element.querySelector('.score');
    if (scoreElement == null) return null;
    return scoreElement.text;
  }

  @override
  int? parseText(String text) {
    final match = RegExp(r'(\d+)').firstMatch(text);
    if (match == null) return null;

    final scoreString = match.group(1);
    if (scoreString == null) return null;

    final score = int.tryParse(scoreString);
    return score;
  }
}
