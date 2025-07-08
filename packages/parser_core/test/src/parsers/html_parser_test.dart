// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:parser_core/parser_core.dart';

void main() {
  group(HtmlParser, () {
    HtmlParser createSubject() => HtmlParser();

    group('parse', () {
      test('returns $Document', () {
        const html = '<html></html>';
        final parser = createSubject();
        final document = parser.parse(html);
        expect(document, isA<Document>());
      });
    });
  });
}
