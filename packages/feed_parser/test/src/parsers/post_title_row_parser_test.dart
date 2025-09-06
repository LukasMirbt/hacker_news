// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockBaseTitleRowParser extends Mock implements BaseTitleRowParser {}

class _MockUpvoteUrlParser extends Mock implements UpvoteUrlParser {}

class _MockHasBeenUpvotedParser extends Mock implements HasBeenUpvotedParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const base = BaseTitleRowDataPlaceholder();
  const upvoteUrl = 'upvoteUrl';
  const hasBeenUpvoted = true;

  group(PostTitleRowParser, () {
    late BaseTitleRowParser baseParser;
    late UpvoteUrlParser upvoteUrlParser;
    late HasBeenUpvotedParser hasBeenUpvotedParser;
    late Element athing;

    setUp(() {
      baseParser = _MockBaseTitleRowParser();
      upvoteUrlParser = _MockUpvoteUrlParser();
      hasBeenUpvotedParser = _MockHasBeenUpvotedParser();
      athing = _MockElement();
    });

    PostTitleRowParser createSubject() {
      return PostTitleRowParser(
        baseTitleRowParser: baseParser,
        upvoteUrlParser: upvoteUrlParser,
        hasBeenUpvotedParser: hasBeenUpvotedParser,
      );
    }

    group('parse', () {
      final parseBase = () => baseParser.parse(athing);
      final parseUpvoteUrl = () => upvoteUrlParser.parse(athing);
      final parseHasBeenUpvoted = () => hasBeenUpvotedParser.parse(athing);

      test('calls parsers and returns $TitleRowData', () {
        when(parseBase).thenReturn(base);
        when(parseUpvoteUrl).thenReturn(upvoteUrl);
        when(parseHasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          PostTitleRowData.fromParsed(
            base: base,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
        verify(parseBase).called(1);
        verify(parseUpvoteUrl).called(1);
        verify(parseHasBeenUpvoted).called(1);
      });
    });
  });
}
