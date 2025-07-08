// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockIdParser extends Mock implements IdParser {}

class _MockRankParser extends Mock implements RankParser {}

class _MockTitleParser extends Mock implements TitleParser {}

class _MockUrlParser extends Mock implements UrlParser {}

class _MockUrlHostParser extends Mock implements UrlHostParser {}

class _MockUpvoteUrlParser extends Mock implements UpvoteUrlParser {}

class _MockHasBeenUpvotedParser extends Mock implements HasBeenUpvotedParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const id = 'id';
  const rank = 1;
  const title = 'title';
  const url = 'url';
  const urlHost = 'urlHost';
  const upvoteUrl = 'upvoteUrl';
  const hasBeenUpvoted = true;

  group(TitleRowDataParser, () {
    late IdParser idParser;
    late RankParser rankParser;
    late TitleParser titleParser;
    late UrlParser urlParser;
    late UrlHostParser urlHostParser;
    late UpvoteUrlParser upvoteUrlParser;
    late HasBeenUpvotedParser hasBeenUpvotedParser;
    late Element athing;

    setUp(() {
      idParser = _MockIdParser();
      rankParser = _MockRankParser();
      titleParser = _MockTitleParser();
      urlParser = _MockUrlParser();
      urlHostParser = _MockUrlHostParser();
      upvoteUrlParser = _MockUpvoteUrlParser();
      hasBeenUpvotedParser = _MockHasBeenUpvotedParser();
      athing = _MockElement();
    });

    TitleRowDataParser createSubject() {
      return TitleRowDataParser(
        idParser: idParser,
        rankParser: rankParser,
        titleParser: titleParser,
        urlParser: urlParser,
        urlHostParser: urlHostParser,
        upvoteUrlParser: upvoteUrlParser,
        hasBeenUpvotedParser: hasBeenUpvotedParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(athing);
      final parseRank = () => rankParser.parse(athing);
      final parseTitle = () => titleParser.parse(athing);
      final parseUrl = () => urlParser.parse(athing);
      final parseUrlHost = () => urlHostParser.parse(athing);
      final parseUpvoteUrl = () => upvoteUrlParser.parse(athing);
      final parseHasBeenUpvoted = () => hasBeenUpvotedParser.parse(athing);

      test('calls parsers and returns $TitleRowData', () {
        when(parseId).thenReturn(id);
        when(parseRank).thenReturn(rank);
        when(parseTitle).thenReturn(title);
        when(parseUrl).thenReturn(url);
        when(parseUrlHost).thenReturn(urlHost);
        when(parseUpvoteUrl).thenReturn(upvoteUrl);
        when(parseHasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          TitleRowData.fromParsed(
            id: id,
            rank: rank,
            title: title,
            url: url,
            urlHost: urlHost,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
        );
        verify(parseId).called(1);
        verify(parseRank).called(1);
        verify(parseTitle).called(1);
        verify(parseUrl).called(1);
        verify(parseUrlHost).called(1);
        verify(parseUpvoteUrl).called(1);
        verify(parseHasBeenUpvoted).called(1);
      });
    });
  });
}
