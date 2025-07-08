import 'package:html/dom.dart';

abstract class ParserTemplate<T> {
  const ParserTemplate();

  String? extractText(Element item);

  T? parseText(String text);

  T? parse(Element item) {
    final text = extractText(item);
    if (text == null) return null;
    return parseText(text);
  }
}
