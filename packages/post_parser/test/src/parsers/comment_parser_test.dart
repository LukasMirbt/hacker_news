// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockIdParser extends Mock implements IdParser {}

class _MockCommentIndentParser extends Mock implements IndentParser {}

class _MockUpvoteUrlParser extends Mock implements UpvoteUrlParser {}

class _MockHasBeenUpvotedParser extends Mock implements HasBeenUpvotedParser {}

class _MockHnuserParser extends Mock implements HnuserParser {}

class _MockAgeParser extends Mock implements AgeParser {}

class _MockCommentHtmlTextParser extends Mock
    implements CommentHtmlTextParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const id = 'id';
  const indent = 1;
  const upvoteUrl = 'upvoteUrl';
  const hasBeenUpvoted = true;
  const hnuser = HnuserPlaceholder();
  final age = DateTime(1);
  const htmlText = 'htmlText';

  group(CommentParser, () {
    late IdParser idParser;
    late IndentParser indentParser;
    late UpvoteUrlParser upvoteUrlParser;
    late HasBeenUpvotedParser hasBeenUpvotedParser;
    late HnuserParser hnuserParser;
    late AgeParser ageParser;
    late CommentHtmlTextParser commentHtmlTextParser;
    late Element element;

    setUp(() {
      idParser = _MockIdParser();
      indentParser = _MockCommentIndentParser();
      upvoteUrlParser = _MockUpvoteUrlParser();
      hasBeenUpvotedParser = _MockHasBeenUpvotedParser();
      hnuserParser = _MockHnuserParser();
      ageParser = _MockAgeParser();
      commentHtmlTextParser = _MockCommentHtmlTextParser();
      element = _MockElement();
      registerFallbackValue(_MockElement());
    });

    CommentParser createSubject() {
      return CommentParser(
        idParser: idParser,
        indentParser: indentParser,
        upvoteUrlParser: upvoteUrlParser,
        hasBeenUpvotedParser: hasBeenUpvotedParser,
        hnuserParser: hnuserParser,
        ageParser: ageParser,
        commentHtmlTextParser: commentHtmlTextParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(element);
      final parseIndent = () => indentParser.parse(element);
      final parseUpvoteUrl = () => upvoteUrlParser.parse(element);
      final parseHasBeenUpvoted = () => hasBeenUpvotedParser.parse(element);
      final parseHnuser = () => hnuserParser.parse(element);
      final parseAge = () => ageParser.parse(element);
      final parseHtmlText = () => commentHtmlTextParser.parse(element);

      test('calls parsers and returns $CommentData', () {
        when(parseId).thenReturn(id);
        when(parseIndent).thenReturn(indent);
        when(parseUpvoteUrl).thenReturn(upvoteUrl);
        when(parseHasBeenUpvoted).thenReturn(hasBeenUpvoted);
        when(parseHnuser).thenReturn(hnuser);
        when(parseAge).thenReturn(age);
        when(parseHtmlText).thenReturn(htmlText);
        final parser = createSubject();
        expect(
          parser.parse(element),
          CommentData.fromParsed(
            id: id,
            indent: indent,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
        );
        verify(parseId).called(1);
        verify(parseIndent).called(1);
        verify(parseUpvoteUrl).called(1);
        verify(parseHasBeenUpvoted).called(1);
        verify(parseHnuser).called(1);
        verify(parseAge).called(1);
        verify(parseHtmlText).called(1);
      });
    });
  });
}
