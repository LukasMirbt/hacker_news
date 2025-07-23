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

  group(ReplyCommentDataParser, () {
    late IdParser idParser;
    late HnuserParser hnuserParser;
    late AgeParser ageParser;
    late CommentHtmlTextParser htmlTextParser;
    late Element athing;

    setUp(() {
      idParser = _MockIdParser();
      hnuserParser = _MockHnuserParser();
      ageParser = _MockAgeParser();
      htmlTextParser = _MockCommentHtmlTextParser();
      athing = _MockElement();
    });

    ReplyCommentDataParser createSubject() {
      return ReplyCommentDataParser(
        idParser: idParser,
        hnuserParser: hnuserParser,
        ageParser: ageParser,
        commentHtmlTextParser: htmlTextParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(athing);
      final parseHnuser = () => hnuserParser.parse(athing);
      final parseAge = () => ageParser.parse(athing);
      final parseHtmlText = () => htmlTextParser.parse(athing);

      test('calls parsers and returns $ReplyCommentData', () {
        when(parseId).thenReturn(id);
        when(parseHnuser).thenReturn(hnuser);
        when(parseAge).thenReturn(age);
        when(parseHtmlText).thenReturn(htmlText);
        final parser = createSubject();
        final result = parser.parse(athing);
        expect(
          result,
          ReplyCommentData.fromParsed(
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
