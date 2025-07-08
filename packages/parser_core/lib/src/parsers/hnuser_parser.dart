import 'package:parser_core/parser_core.dart';

class HnuserParser {
  const HnuserParser();

  Hnuser? parse(Element element) {
    final userAnchor = element.querySelector('.hnuser');
    if (userAnchor == null) return null;

    final children = userAnchor.children;

    if (children.isEmpty) {
      return Hnuser(
        id: userAnchor.text,
        isNew: false,
      );
    }

    return Hnuser(
      id: children.first.text,
      isNew: true,
    );
  }
}
