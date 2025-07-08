import 'package:parser_core/parser_core.dart';

class IndentParser extends ParserTemplate<int> {
  const IndentParser();

  @override
  String? extractText(Element element) {
    final indentElement = element.querySelector('.ind');
    if (indentElement == null) return null;
    return indentElement.attributes['indent'];
  }

  @override
  int? parseText(String text) => int.tryParse(text);
}
