// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../lib/reply_parser.dart';

class _MockReplyFormTitleRowDataParser extends Mock
    implements ReplyFormTitleRowDataParser {}

class _MockCommentHtmlTextParser extends Mock
    implements CommentHtmlTextParser {}

class _MockHmacParser extends Mock implements HmacParser {}

class _MockElement extends Mock implements Element {}

void main() {
  final titleRowData = ReplyFormTitleRowDataPlaceholder();
  const htmlText = 'htmlText';
  const hmac = 'hmac';

  group(ReplyFormDataParser, () {
    late ReplyFormTitleRowDataParser titleRowDataParser;
    late CommentHtmlTextParser htmlTextParser;
    late HmacParser hmacParser;
    late Element fatItem;
    late Element athing;

    setUp(() {
      titleRowDataParser = _MockReplyFormTitleRowDataParser();
      htmlTextParser = _MockCommentHtmlTextParser();
      hmacParser = _MockHmacParser();
      fatItem = _MockElement();
      athing = _MockElement();
    });

    ReplyFormDataParser createSubject() {
      return ReplyFormDataParser(
        replyFormTitleRowDataParser: titleRowDataParser,
        commentHtmlTextParser: htmlTextParser,
        hmacParser: hmacParser,
      );
    }

    group('parse', () {
      final athingSelector = () => fatItem.querySelector('.athing');

      final parseTitleRowData = () => titleRowDataParser.parse(athing);
      final parseHtmlText = () => htmlTextParser.parse(fatItem);
      final parseHmac = () => hmacParser.parse(fatItem);

      test('returns $ReplyFormData with correct values '
          'when data is non-null', () {
        when(athingSelector).thenReturn(athing);
        when(parseTitleRowData).thenReturn(titleRowData);
        when(parseHtmlText).thenReturn(htmlText);
        when(parseHmac).thenReturn(hmac);
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          ReplyFormData(
            titleRowData: titleRowData,
            htmlText: htmlText,
            hmac: hmac,
          ),
        );
        verify(athingSelector).called(1);
        verify(parseTitleRowData).called(1);
        verify(parseHtmlText).called(1);
        verify(parseHmac).called(1);
      });

      test('returns $ReplyFormData with correct values '
          'when data is null', () {
        final parser = createSubject();
        expect(
          parser.parse(fatItem),
          ReplyFormData(
            titleRowData: ReplyFormTitleRowData.empty,
            htmlText: null,
            hmac: null,
          ),
        );
      });
    });
  });
}
