// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockTitleRowDataParser extends Mock implements TitleRowDataParser {}

class _MockSubtitleRowDataParser extends Mock
    implements SubtitleRowDataParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const titleRowData = TitleRowDataPlaceholder();
  final subtitleRowData = SubtitleRowDataPlaceholder();

  group(FeedItemParser, () {
    late TitleRowDataParser titleRowDataParser;
    late SubtitleRowDataParser subtitleRowDataParser;
    late Element athing;
    late Element subtitleRow;

    setUp(() {
      titleRowDataParser = _MockTitleRowDataParser();
      subtitleRowDataParser = _MockSubtitleRowDataParser();
      athing = _MockElement();
      subtitleRow = _MockElement();
    });

    FeedItemParser createSubject() {
      return FeedItemParser(
        titleRowDataParser: titleRowDataParser,
        subtitleRowDataParser: subtitleRowDataParser,
      );
    }

    group('parse', () {
      final parseTitleRowData = () => titleRowDataParser.parse(athing);
      final parseSubtitleRowData = () =>
          subtitleRowDataParser.parse(subtitleRow);

      test('returns $FeedItemData with correct values '
          'when data is non-null', () {
        when(parseTitleRowData).thenReturn(titleRowData);
        when(() => athing.nextElementSibling).thenReturn(subtitleRow);
        when(parseSubtitleRowData).thenReturn(subtitleRowData);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          FeedItemData(
            titleRowData: titleRowData,
            subtitleRowData: subtitleRowData,
          ),
        );
        verify(parseTitleRowData).called(1);
        verify(parseSubtitleRowData).called(1);
      });

      test('returns $FeedItemData with correct values '
          'when data is null', () {
        when(parseTitleRowData).thenReturn(titleRowData);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          FeedItemData(
            titleRowData: titleRowData,
            subtitleRowData: SubtitleRowData.empty,
          ),
        );
        verify(parseTitleRowData).called(1);
      });
    });
  });
}
