import 'package:html/parser.dart' as html;

class TextParser {
  const TextParser();

  String parse(String htmlText) {
    final document = html.parse(htmlText);
    final buffer = StringBuffer();
    final nodes = document.body?.nodes;

    if (nodes == null) return '';

    for (final node in nodes) {
      final nodeText = node.text;

      if (nodeText == null || nodeText.trim().isEmpty) {
        continue;
      }

      final cleanedText = nodeText.replaceAll(RegExp(r'\s+'), ' ').trim();

      if (buffer.isNotEmpty) {
        buffer.write(' ');
      }

      buffer.write(cleanedText);
    }

    return buffer.toString();
  }
}
