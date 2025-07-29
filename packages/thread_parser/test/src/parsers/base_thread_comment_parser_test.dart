// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_parser/thread_parser.dart';

class _MockIdParser extends Mock implements IdParser {}

class _MockIndentParser extends Mock implements IndentParser {}

class _MockHnuserParser extends Mock implements HnuserParser {}

class _MockAgeParser extends Mock implements AgeParser {}

class _MockCommentHtmlTextParser extends Mock
    implements CommentHtmlTextParser {}

class _MockReplyUrlParser extends Mock implements ReplyUrlParser {}

class _MockParentUrlParser extends Mock implements ParentUrlParser {}

class _MockContextUrlParser extends Mock implements ContextUrlParser {}

class _MockOnUrlParser extends Mock implements OnUrlParser {}

class _MockOnTitleParser extends Mock implements OnTitleParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const id = 'id';
  const indent = 1;
  const hnuser = HnuserPlaceholder();
  final age = DateTime(1);
  const htmlText = 'htmlText';
  const replyUrl = 'replyUrl';
  const parentUrl = 'parentUrl';
  const contextUrl = 'contextUrl';
  const onUrl = 'onUrl';
  const onTitle = 'onTitle';

  group(BaseThreadCommentParser, () {
    late IdParser idParser;
    late IndentParser indentParser;
    late HnuserParser hnuserParser;
    late AgeParser ageParser;
    late CommentHtmlTextParser commentHtmlTextParser;
    late ReplyUrlParser replyUrlParser;
    late ParentUrlParser parentUrlParser;
    late ContextUrlParser contextUrlParser;
    late OnUrlParser onUrlParser;
    late OnTitleParser onTitleParser;
    late Element element;

    setUp(() {
      idParser = _MockIdParser();
      indentParser = _MockIndentParser();
      hnuserParser = _MockHnuserParser();
      ageParser = _MockAgeParser();
      commentHtmlTextParser = _MockCommentHtmlTextParser();
      replyUrlParser = _MockReplyUrlParser();
      parentUrlParser = _MockParentUrlParser();
      contextUrlParser = _MockContextUrlParser();
      onUrlParser = _MockOnUrlParser();
      onTitleParser = _MockOnTitleParser();
      element = _MockElement();
      registerFallbackValue(_MockElement());
    });

    BaseThreadCommentParser createSubject() {
      return BaseThreadCommentParser(
        idParser: idParser,
        indentParser: indentParser,
        hnuserParser: hnuserParser,
        ageParser: ageParser,
        commentHtmlTextParser: commentHtmlTextParser,
        replyUrlParser: replyUrlParser,
        parentUrlParser: parentUrlParser,
        contextUrlParser: contextUrlParser,
        onUrlParser: onUrlParser,
        onTitleParser: onTitleParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(element);
      final parseIndent = () => indentParser.parse(element);
      final parseHnuser = () => hnuserParser.parse(element);
      final parseAge = () => ageParser.parse(element);
      final parseHtmlText = () => commentHtmlTextParser.parse(element);
      final parseReplyUrl = () => replyUrlParser.parse(element);
      final parseParentUrl = () => parentUrlParser.parse(element);
      final parseContextUrl = () => contextUrlParser.parse(element);
      final parseOnUrl = () => onUrlParser.parse(element);
      final parseOnTitle = () => onTitleParser.parse(element);

      test('calls parsers and returns $BaseThreadCommentData', () {
        when(parseId).thenReturn(id);
        when(parseIndent).thenReturn(indent);
        when(parseHnuser).thenReturn(hnuser);
        when(parseAge).thenReturn(age);
        when(parseHtmlText).thenReturn(htmlText);
        when(parseReplyUrl).thenReturn(replyUrl);
        when(parseParentUrl).thenReturn(parentUrl);
        when(parseContextUrl).thenReturn(contextUrl);
        when(parseOnUrl).thenReturn(onUrl);
        when(parseOnTitle).thenReturn(onTitle);
        final parser = createSubject();
        expect(
          parser.parse(element),
          BaseThreadCommentData.fromParsed(
            id: id,
            indent: indent,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            replyUrl: replyUrl,
            parentUrl: parentUrl,
            contextUrl: contextUrl,
            onUrl: onUrl,
            onTitle: onTitle,
          ),
        );
        verify(parseId).called(1);
        verify(parseIndent).called(1);
        verify(parseHnuser).called(1);
        verify(parseAge).called(1);
        verify(parseHtmlText).called(1);
        verify(parseReplyUrl).called(1);
        verify(parseParentUrl).called(1);
        verify(parseContextUrl).called(1);
        verify(parseOnUrl).called(1);
        verify(parseOnTitle).called(1);
      });
    });
  });
}
