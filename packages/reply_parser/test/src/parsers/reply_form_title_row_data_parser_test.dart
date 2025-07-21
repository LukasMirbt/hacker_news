// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../lib/reply_parser.dart';

class _MockElement extends Mock implements Element {}

class _MockIdParser extends Mock implements IdParser {}

class _MockHnuserParser extends Mock implements HnuserParser {}

class _MockAgeParser extends Mock implements AgeParser {}

void main() {
  const id = 'id';
  const hnuser = HnuserPlaceholder();
  final age = DateTime(1);

  group(ReplyFormTitleRowDataParser, () {
    late Element athing;
    late IdParser idParser;
    late HnuserParser hnuserParser;
    late AgeParser ageParser;

    setUp(() {
      athing = _MockElement();
      idParser = _MockIdParser();
      hnuserParser = _MockHnuserParser();
      ageParser = _MockAgeParser();
    });

    ReplyFormTitleRowDataParser createSubject() {
      return ReplyFormTitleRowDataParser(
        idParser: idParser,
        hnuserParser: hnuserParser,
        ageParser: ageParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(athing);
      final parseHnuser = () => hnuserParser.parse(athing);
      final parseAge = () => ageParser.parse(athing);

      test('calls parsers and returns $ReplyFormTitleRowData', () {
        when(parseId).thenReturn(id);
        when(parseHnuser).thenReturn(hnuser);
        when(parseAge).thenReturn(age);
        final parser = createSubject();
        final result = parser.parse(athing);
        expect(
          result,
          ReplyFormTitleRowData.fromParsed(
            id: id,
            hnuser: hnuser,
            age: age,
          ),
        );
        verify(parseId).called(1);
        verify(parseHnuser).called(1);
        verify(parseAge).called(1);
      });
    });
  });
}
