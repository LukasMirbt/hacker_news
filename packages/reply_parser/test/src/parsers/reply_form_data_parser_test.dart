// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_parser/reply_parser.dart';

class _MockParentParser extends Mock implements ParentParser {}

class _MockGotoParser extends Mock implements GotoParser {}

class _MockHmacParser extends Mock implements HmacParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const parent = 'parent';
  const goto = 'goto';
  const hmac = 'hmac';

  group(ReplyFormDataParser, () {
    late ParentParser parentParser;
    late GotoParser gotoParser;
    late HmacParser hmacParser;
    late Element fatItem;

    setUp(() {
      parentParser = _MockParentParser();
      gotoParser = _MockGotoParser();
      hmacParser = _MockHmacParser();
      fatItem = _MockElement();
    });

    ReplyFormDataParser createSubject() {
      return ReplyFormDataParser(
        parentParser: parentParser,
        gotoParser: gotoParser,
        hmacParser: hmacParser,
      );
    }

    group('parse', () {
      final parseParent = () => parentParser.parse(fatItem);
      final parseGoto = () => gotoParser.parse(fatItem);
      final parseHmac = () => hmacParser.parse(fatItem);

      test('calls parsers and returns $ReplyFormData', () {
        when(parseParent).thenReturn(parent);
        when(parseGoto).thenReturn(goto);
        when(parseHmac).thenReturn(hmac);
        final parser = createSubject();
        final result = parser.parse(fatItem);
        expect(
          result,
          ReplyFormData.fromParsed(
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
