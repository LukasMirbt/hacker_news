import 'package:html/parser.dart' as html;

class TextParser {
  const TextParser();

  String parse(String htmlText) {
    final document = html.parse(htmlText);

    final body = document.body;
    if (body == null) return '';

    final buffer = StringBuffer();

    for (final node in body.nodes) {
      final nodeText = node.text;

      if (nodeText == null) continue;
      if (nodeText.trim().isEmpty) continue;

      final cleanedText = nodeText.replaceAll(RegExp(r'\s+'), ' ').trim();

      if (buffer.isNotEmpty) {
        buffer.write(' ');
      }

      buffer.write(cleanedText);
    }

    return buffer.toString();
  }
}
