import 'package:html/dom.dart';

class GotoParser {
  const GotoParser();

  String? parse(Element element) {
    final input = element.querySelector('input[name="goto"]');
    if (input == null) return null;
    return input.attributes['value'];
  }
}
