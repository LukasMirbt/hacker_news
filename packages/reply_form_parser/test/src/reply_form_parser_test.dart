// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_form_parser/reply_form_parser.dart';

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockReplyFormDataParser extends Mock implements ReplyFormDataParser {}

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

class _MockReplyFormData extends Mock implements ReplyFormData {}

void main() {
  group(ReplyFormParser, () {
    late HtmlParser htmlParser;
    late ReplyFormDataParser dataParser;
    late Document document;

    setUp(() {
      htmlParser = _MockHtmlParser();
      dataParser = _MockReplyFormDataParser();
      document = _MockDocument();
    });

    ReplyFormParser createSubject() {
      return ReplyFormParser(
        htmlParser: htmlParser,
        replyFormDataParser: dataParser,
      );
    }

    group('parse', () {
      const html = 'html';
      final fatItem = _MockElement();
      final data = _MockReplyFormData();

      final parseHtml = () => htmlParser.parse(html);
      final fatItemSelector = () => document.querySelector('.fatitem');
      final parseData = () => dataParser.parse(fatItem);

      test('returns $ReplyFormData when fatItem is non-null', () {
        when(parseHtml).thenReturn(document);
        when(fatItemSelector).thenReturn(fatItem);
        when(parseData).thenReturn(data);
        final parser = createSubject();
        expect(parser.parse(html), data);
        verify(parseHtml).called(1);
        verify(fatItemSelector).called(1);
        verify(parseData).called(1);
      });

      test('returns empty $ReplyFormData when fatItem is null', () {
        when(parseHtml).thenReturn(document);
        final parser = createSubject();
        expect(
          parser.parse(html),
          ReplyFormData.empty,
        );
        verify(parseHtml).called(1);
      });
    });
  });
}
