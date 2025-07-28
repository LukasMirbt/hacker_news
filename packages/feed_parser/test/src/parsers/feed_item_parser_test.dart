// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockTitleRowParser extends Mock implements TitleRowParser {}

class _MockSubtitleRowParser extends Mock implements SubtitleRowParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const titleRowData = TitleRowDataPlaceholder();
  final subtitleRowData = SubtitleRowDataPlaceholder();

  group(FeedItemParser, () {
    late TitleRowParser titleRowParser;
    late SubtitleRowParser subtitleRowParser;
    late Element athing;
    late Element subtitleRow;

    setUp(() {
      titleRowParser = _MockTitleRowParser();
      subtitleRowParser = _MockSubtitleRowParser();
      athing = _MockElement();
      subtitleRow = _MockElement();
    });

    FeedItemParser createSubject() {
      return FeedItemParser(
        titleRowParser: titleRowParser,
        subtitleRowParser: subtitleRowParser,
      );
    }

    group('parse', () {
      final parseTitleRowData = () => titleRowParser.parse(athing);
      final parseSubtitleRowData = () => subtitleRowParser.parse(subtitleRow);

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
