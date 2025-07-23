// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockParentParser extends Mock implements ParentParser {}

class _MockGotoParser extends Mock implements GotoParser {}

class _MockHmacParser extends Mock implements HmacParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const parent = 'parent';
  const goto = 'goto';
  const hmac = 'hmac';

  group(DetailCommentFormParser, () {
    late Element subtext;
    late ParentParser parentParser;
    late GotoParser gotoParser;
    late HmacParser hmacParser;

    setUp(() {
      subtext = _MockElement();
      parentParser = _MockParentParser();
      gotoParser = _MockGotoParser();
      hmacParser = _MockHmacParser();
    });

    DetailCommentFormParser createSubject() {
      return DetailCommentFormParser(
        parentParser: parentParser,
        gotoParser: gotoParser,
        hmacParser: hmacParser,
      );
    }

    group('parse', () {
      final parseParent = () => parentParser.parse(subtext);
      final parseGoto = () => gotoParser.parse(subtext);
      final parseHmac = () => hmacParser.parse(subtext);

      test('calls parsers and returns $DetailCommentFormData', () {
        when(parseParent).thenReturn(parent);
        when(parseGoto).thenReturn(goto);
        when(parseHmac).thenReturn(hmac);
        final parser = createSubject();
        expect(
          parser.parse(subtext),
          DetailCommentFormData.fromParsed(
            parent: parent,
            goto: goto,
            hmac: hmac,
          ),
        );
        verify(parseParent).called(1);
        verify(parseGoto).called(1);
        verify(parseHmac).called(1);
      });
    });
  });
}
