import 'package:authentication_parser/authentication_parser.dart';

class KarmaParser {
  const KarmaParser();

  int? parse(Document document) {
    final element = document.getElementById('karma');
    if (element == null) return null;
    return int.tryParse(element.text);
  }
}
