// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockDetailTitleRowParser extends Mock implements DetailTitleRowParser {}

class _MockDetailSubtitleRowParser extends Mock
    implements DetailSubtitleRowParser {}

class _MockDetailHtmlTextParser extends Mock implements DetailHtmlTextParser {}

class _MockHmacParser extends Mock implements HmacParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const titleRowData = DetailTitleRowDataPlaceholder();
  final subtitleRowData = DetailSubtitleRowDataPlaceholder();
  const htmlText = 'htmlText';
  const hmac = 'hmac';

  group(DetailFatItemParser, () {
    late DetailTitleRowParser titleRowParser;
    late DetailSubtitleRowParser subtitleRowParser;
    late DetailHtmlTextParser htmlTextParser;
    late HmacParser hmacParser;
    late Element fatItem;
    late Element athing;
    late Element subtext;

    setUp(() {
      titleRowParser = _MockDetailTitleRowParser();
      subtitleRowParser = _MockDetailSubtitleRowParser();
      htmlTextParser = _MockDetailHtmlTextParser();
      hmacParser = _MockHmacParser();
      fatItem = _MockElement();
      athing = _MockElement();
      subtext = _MockElement();
    });

    DetailFatItemParser createSubject() {
      return DetailFatItemParser(
        titleRowParser: titleRowParser,
        subtitleRowParser: subtitleRowParser,
        htmlTextParser: htmlTextParser,
        detailHmacParser: hmacParser,
      );
    }

    group('parse', () {
      final athingSelector = () => fatItem.querySelector('.athing');
      final subtextSelector = () => fatItem.querySelector('.subtext');

      final parseTitleRow = () => titleRowParser.parse(athing);
      final parseSubtitleRow = () => subtitleRowParser.parse(subtext);
      final parseHtmlText = () => htmlTextParser.parse(fatItem);
      final parseHmac = () => hmacParser.parse(fatItem);

      test('returns $DetailFatItemData with correct values '
          'when data is non-null', () {
        when(athingSelector).thenReturn(athing);
        when(subtextSelector).thenReturn(subtext);
        when(parseTitleRow).thenReturn(titleRowData);
        when(parseSubtitleRow).thenReturn(subtitleRowData);
        when(parseHtmlText).thenReturn(htmlText);
        when(parseHmac).thenReturn(hmac);
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          DetailFatItemData(
            titleRowData: titleRowData,
            subtitleRowData: subtitleRowData,
            htmlText: htmlText,
            hmac: hmac,
          ),
        );
        verify(athingSelector).called(1);
        verify(subtextSelector).called(1);
        verify(parseTitleRow).called(1);
        verify(parseSubtitleRow).called(1);
        verify(parseHtmlText).called(1);
        verify(parseHmac).called(1);
      });

      test('returns $DetailFatItemData with correct values '
          'when data is null', () {
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          DetailFatItemData(
            titleRowData: DetailTitleRowData.empty,
            subtitleRowData: DetailSubtitleRowData.empty,
            htmlText: null,
            hmac: null,
          ),
        );
      });
    });
  });
}
