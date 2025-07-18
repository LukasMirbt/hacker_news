// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_parser/thread_parser.dart';

class _MockIdParser extends Mock implements IdParser {}

class _MockHnuserParser extends Mock implements HnuserParser {}

class _MockAgeParser extends Mock implements AgeParser {}

class _MockCommentHtmlTextParser extends Mock
    implements CommentHtmlTextParser {}

class _MockIndentParser extends Mock implements IndentParser {}

class _MockScoreParser extends Mock implements ScoreParser {}

class _MockHasBeenUpvotedParser extends Mock implements HasBeenUpvotedParser {}

class _MockUpvoteUrlParser extends Mock implements UpvoteUrlParser {}

class _MockParentUrlParser extends Mock implements ParentUrlParser {}

class _MockContextUrlParser extends Mock implements ContextUrlParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const id = 'id';
  const hnuser = HnuserPlaceholder();
  final age = DateTime(1);
  const htmlText = 'htmlText';
  const indent = 1;
  const score = 1;
  const hasBeenUpvoted = true;
  const upvoteUrl = 'upvoteUrl';
  const parentUrl = 'parentUrl';
  const contextUrl = 'contextUrl';

  group(ThreadCommentParser, () {
    late IdParser idParser;
    late HnuserParser hnuserParser;
    late AgeParser ageParser;
    late CommentHtmlTextParser htmlTextParser;
    late IndentParser indentParser;
    late ScoreParser scoreParser;
    late HasBeenUpvotedParser hasBeenUpvotedParser;
    late UpvoteUrlParser upvoteUrlParser;
    late ParentUrlParser parentUrlParser;
    late ContextUrlParser contextUrlParser;
    late Element element;

    setUp(() {
      idParser = _MockIdParser();
      hnuserParser = _MockHnuserParser();
      ageParser = _MockAgeParser();
      htmlTextParser = _MockCommentHtmlTextParser();
      indentParser = _MockIndentParser();
      scoreParser = _MockScoreParser();
      hasBeenUpvotedParser = _MockHasBeenUpvotedParser();
      upvoteUrlParser = _MockUpvoteUrlParser();
      parentUrlParser = _MockParentUrlParser();
      contextUrlParser = _MockContextUrlParser();
      element = _MockElement();
      registerFallbackValue(_MockElement());
    });

    ThreadCommentParser createSubject() {
      return ThreadCommentParser(
        idParser: idParser,
        hnuserParser: hnuserParser,
        ageParser: ageParser,
        commentHtmlTextParser: htmlTextParser,
        indentParser: indentParser,
        scoreParser: scoreParser,
        hasBeenUpvotedParser: hasBeenUpvotedParser,
        upvoteUrlParser: upvoteUrlParser,
        parentUrlParser: parentUrlParser,
        contextUrlParser: contextUrlParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(element);
      final parseHnuser = () => hnuserParser.parse(element);
      final parseAge = () => ageParser.parse(element);
      final parseHtmlText = () => htmlTextParser.parse(element);
      final parseIndent = () => indentParser.parse(element);
      final parseScore = () => scoreParser.parse(element);
      final parseHasBeenUpvoted = () => hasBeenUpvotedParser.parse(element);
      final parseUpvoteUrl = () => upvoteUrlParser.parse(element);
      final parseParentUrl = () => parentUrlParser.parse(element);
      final parseContextUrl = () => contextUrlParser.parse(element);

      test('calls parsers and returns $ThreadCommentData', () {
        when(parseId).thenReturn(id);
        when(parseHnuser).thenReturn(hnuser);
        when(parseAge).thenReturn(age);
        when(parseHtmlText).thenReturn(htmlText);
        when(parseIndent).thenReturn(indent);
        when(parseScore).thenReturn(score);
        when(parseHasBeenUpvoted).thenReturn(hasBeenUpvoted);
        when(parseUpvoteUrl).thenReturn(upvoteUrl);
        when(parseParentUrl).thenReturn(parentUrl);
        when(parseContextUrl).thenReturn(contextUrl);
        final parser = createSubject();
        expect(
          parser.parse(element),
          ThreadCommentData.fromParsed(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            indent: indent,
            score: score,
            hasBeenUpvoted: hasBeenUpvoted,
            upvoteUrl: upvoteUrl,
            parentUrl: parentUrl,
            contextUrl: contextUrl,
          ),
        );
        verify(parseId).called(1);
        verify(parseHnuser).called(1);
        verify(parseAge).called(1);
        verify(parseHtmlText).called(1);
        verify(parseIndent).called(1);
        verify(parseScore).called(1);
        verify(parseHasBeenUpvoted).called(1);
        verify(parseUpvoteUrl).called(1);
        verify(parseParentUrl).called(1);
        verify(parseContextUrl).called(1);
      });
    });
  });
}
