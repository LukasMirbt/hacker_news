import 'package:collection/collection.dart';
import 'package:html/dom.dart';

class DeleteUrlParser {
  const DeleteUrlParser();

  String? parse(Element athing) {
    final navsElement = athing.querySelector('.navs');
    if (navsElement == null) return null;

    final anchors = navsElement.querySelectorAll('a');

    final deleteAnchor = anchors.firstWhereOrNull(
      (athing) => athing.text.contains('delete'),
    );
    if (deleteAnchor == null) return null;

    return deleteAnchor.attributes['href'];
  }
}
