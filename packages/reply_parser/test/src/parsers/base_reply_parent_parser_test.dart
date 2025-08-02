// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_parser/reply_parser.dart';

class _MockIdParser extends Mock implements IdParser {}

class _MockHnuserParser extends Mock implements HnuserParser {}

class _MockAgeParser extends Mock implements AgeParser {}

class _MockCommentHtmlTextParser extends Mock
    implements CommentHtmlTextParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const id = 'id';
  const hnuser = HnuserPlaceholder();
  final age = DateTime(1);
  const htmlText = 'htmlText';

  group(BaseReplyParentParser, () {
    late IdParser idParser;
    late HnuserParser hnuserParser;
    late AgeParser ageParser;
    late CommentHtmlTextParser commentHtmlTextParser;
    late Element element;

    setUp(() {
      idParser = _MockIdParser();
      hnuserParser = _MockHnuserParser();
      ageParser = _MockAgeParser();
      commentHtmlTextParser = _MockCommentHtmlTextParser();
      element = _MockElement();
      registerFallbackValue(_MockElement());
    });

    BaseReplyParentParser createSubject() {
      return BaseReplyParentParser(
        idParser: idParser,
        hnuserParser: hnuserParser,
        ageParser: ageParser,
        commentHtmlTextParser: commentHtmlTextParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(element);
      final parseHnuser = () => hnuserParser.parse(element);
      final parseAge = () => ageParser.parse(element);
      final parseHtmlText = () => commentHtmlTextParser.parse(element);

      test('calls parsers and returns $BaseReplyParentData', () {
        when(parseId).thenReturn(id);
        when(parseHnuser).thenReturn(hnuser);
        when(parseAge).thenReturn(age);
        when(parseHtmlText).thenReturn(htmlText);
        final parser = createSubject();
        expect(
          parser.parse(element),
          BaseReplyParentData.fromParsed(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
        );
        verify(parseId).called(1);
        verify(parseHnuser).called(1);
        verify(parseAge).called(1);
        verify(parseHtmlText).called(1);
      });
    });
  });
}
