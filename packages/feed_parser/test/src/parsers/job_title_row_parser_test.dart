// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockBaseTitleRowParser extends Mock implements BaseTitleRowParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const base = BaseTitleRowDataPlaceholder();

  group(JobTitleRowParser, () {
    late BaseTitleRowParser baseParser;
    late Element athing;

    setUp(() {
      baseParser = _MockBaseTitleRowParser();
      athing = _MockElement();
    });

    JobTitleRowParser createSubject() {
      return JobTitleRowParser(
        baseTitleRowParser: baseParser,
      );
    }

    group('parse', () {
      final parseBase = () => baseParser.parse(athing);

      test('calls parsers and returns $TitleRowData', () {
        when(parseBase).thenReturn(base);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          JobTitleRowData(base: base),
        );
        verify(parseBase).called(1);
      });
    });
  });
}
