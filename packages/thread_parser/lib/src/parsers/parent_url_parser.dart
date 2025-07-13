import 'package:collection/collection.dart';
import 'package:html/dom.dart';

class ParentUrlParser {
  const ParentUrlParser();

  String? parse(Element element) {
    final navsElement = element.querySelector('.navs');
    if (navsElement == null) return null;

    final anchors = navsElement.querySelectorAll('a');

    final parentAnchor = anchors.firstWhereOrNull(
      (element) => element.text.contains('parent'),
    );
    if (parentAnchor == null) return null;

    return parentAnchor.attributes['href'];
  }
}
