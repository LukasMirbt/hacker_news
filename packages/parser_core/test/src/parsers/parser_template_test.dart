// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

final class _TestParser extends ParserTemplate<String> {
  _TestParser({
    required this.extractedText,
    required this.parsedText,
  });

  final String? extractedText;
  final String? parsedText;

  int extractCalls = 0;
  int parseCalls = 0;

  @override
  String? extractText(Element item) {
    extractCalls += 1;
    return extractedText;
  }

  @override
  String? parseText(String text) {
    parseCalls += 1;
    return parsedText;
  }
}

class _MockElement extends Mock implements Element {}

void main() {
  group(ParserTemplate, () {
    late Element item;

    setUp(() {
      item = _MockElement();
    });

    group('parse', () {
      test('returns null when extractText returns null', () {
        final parser = _TestParser(
          extractedText: null,
          parsedText: null,
        );
        expect(parser.parse(item), null);
        expect(parser.extractCalls, 1);
        expect(parser.parseCalls, 0);
      });

      test('returns parsed text when extractText returns string', () {
        const parsedText = 'parsedText';
        final parser = _TestParser(
          extractedText: 'extractedText',
          parsedText: parsedText,
        );
        expect(parser.parse(item), parsedText);
        expect(parser.extractCalls, 1);
        expect(parser.parseCalls, 1);
      });
    });
  });
}
