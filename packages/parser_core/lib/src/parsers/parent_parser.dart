import 'package:html/dom.dart';

class ParentParser {
  const ParentParser();

  String? parse(Element element) {
    final input = element.querySelector('input[name="parent"]');
    if (input == null) return null;
    return input.attributes['value'];
  }
}
