import 'package:html/dom.dart';

class HmacParser {
  const HmacParser();

  String? parse(Element element) {
    final input = element.querySelector('input[name="hmac"]');
    if (input == null) return null;
    return input.attributes['value'];
  }
}
