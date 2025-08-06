// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_parser/reply_parser.dart';

class _MockBaseReplyParentParser extends Mock
    implements BaseReplyParentParser {}

class _MockScoreParser extends Mock implements ScoreParser {}

class _MockUpvoteUrlParser extends Mock implements UpvoteUrlParser {}

class _MockHasBeenUpvotedParser extends Mock implements HasBeenUpvotedParser {}

class _MockElement extends Mock implements Element {}

void main() {
  final base = BaseReplyParentDataPlaceholder();
  const score = 1;
  const upvoteUrl = 'upvoteUrl';
  const hasBeenUpvoted = true;

  group(ReplyParentParser, () {
    late BaseReplyParentParser baseParser;
    late ScoreParser scoreParser;
    late UpvoteUrlParser upvoteUrlParser;
    late HasBeenUpvotedParser hasBeenUpvotedParser;
    late Element element;

    setUp(() {
      baseParser = _MockBaseReplyParentParser();
      scoreParser = _MockScoreParser();
      upvoteUrlParser = _MockUpvoteUrlParser();
      hasBeenUpvotedParser = _MockHasBeenUpvotedParser();
      element = _MockElement();
      registerFallbackValue(_MockElement());
    });

    ReplyParentParser createSubject() {
      return ReplyParentParser(
        baseReplyParentParser: baseParser,
        upvoteUrlParser: upvoteUrlParser,
        hasBeenUpvotedParser: hasBeenUpvotedParser,
        scoreParser: scoreParser,
      );
    }

    group('parse', () {
      final parseBase = () => baseParser.parse(element);
      final parseScore = () => scoreParser.parse(element);
      final parseUpvoteUrl = () => upvoteUrlParser.parse(element);
      final parseHasBeenUpvoted = () => hasBeenUpvotedParser.parse(element);

      test('calls parsers and returns $CurrentUserReplyParentData '
          'when score is non-null', () {
        when(parseBase).thenReturn(base);
        when(parseScore).thenReturn(score);
        final parser = createSubject();
        expect(
          parser.parse(element),
          CurrentUserReplyParentData.fromParsed(
            base: base,
            score: score,
          ),
        );
        verify(parseBase).called(1);
        verify(parseScore).called(1);
      });

      test('calls parsers and returns $OtherUserReplyParentData '
          'when score is null', () {
        when(parseBase).thenReturn(base);
        when(parseUpvoteUrl).thenReturn(upvoteUrl);
        when(parseHasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final parser = createSubject();
        expect(
          parser.parse(element),
          OtherUserReplyParentData.fromParsed(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
        verify(parseBase).called(1);
        verify(parseScore).called(1);
        verify(parseUpvoteUrl).called(1);
        verify(parseHasBeenUpvoted).called(1);
      });
    });
  });
}
