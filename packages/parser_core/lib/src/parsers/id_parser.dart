import 'package:html/dom.dart';

class IdParser {
  const IdParser();

  String? parse(Element item) => item.attributes['id'];
}
