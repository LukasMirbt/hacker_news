// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_parser/reply_parser.dart';

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockReplyDataParser extends Mock implements ReplyDataParser {}

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

class _MockReplyData extends Mock implements ReplyData {}

void main() {
  group(ReplyParser, () {
    late HtmlParser htmlParser;
    late ReplyDataParser dataParser;
    late Document document;

    setUp(() {
      htmlParser = _MockHtmlParser();
      dataParser = _MockReplyDataParser();
      document = _MockDocument();
    });

    ReplyParser createSubject() {
      return ReplyParser(
        htmlParser: htmlParser,
        replyDataParser: dataParser,
      );
    }

    group('parse', () {
      const html = 'html';
      final fatItem = _MockElement();
      final data = _MockReplyData();

      final parseHtml = () => htmlParser.parse(html);
      final fatItemSelector = () => document.querySelector('.fatitem');
      final parseData = () => dataParser.parse(fatItem);

      test('returns $ReplyData when fatItem is non-null', () {
        when(parseHtml).thenReturn(document);
        when(fatItemSelector).thenReturn(fatItem);
        when(parseData).thenReturn(data);
        final parser = createSubject();
        expect(parser.parse(html), data);
        verify(parseHtml).called(1);
        verify(fatItemSelector).called(1);
        verify(parseData).called(1);
      });

      test('returns empty $ReplyData when fatItem is null', () {
        when(parseHtml).thenReturn(document);
        final parser = createSubject();
        expect(
          parser.parse(html),
          ReplyData.empty,
        );
        verify(parseHtml).called(1);
      });
    });
  });
}
