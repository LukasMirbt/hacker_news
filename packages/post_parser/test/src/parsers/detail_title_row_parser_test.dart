// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockIdParser extends Mock implements IdParser {}

class _MockTitleParser extends Mock implements TitleParser {}

class _MockUrlParser extends Mock implements UrlParser {}

class _MockUpvoteUrlParser extends Mock implements UpvoteUrlParser {}

class _MockHasBeenUpvotedParser extends Mock implements HasBeenUpvotedParser {}

class _MockUrlHostParser extends Mock implements UrlHostParser {}

class _MockElement extends Mock implements Element {}

void main() {
  const id = 'id';
  const title = 'title';
  const url = 'url';
  const upvoteUrl = 'upvoteUrl';
  const hasBeenUpvoted = true;
  const urlHost = 'urlHost';

  group(DetailTitleRowParser, () {
    late Element athing;
    late IdParser idParser;
    late TitleParser titleParser;
    late UrlParser urlParser;
    late UpvoteUrlParser upvoteUrlParser;
    late HasBeenUpvotedParser hasBeenUpvotedParser;
    late UrlHostParser urlHostParser;

    setUp(() {
      athing = _MockElement();
      idParser = _MockIdParser();
      titleParser = _MockTitleParser();
      urlParser = _MockUrlParser();
      upvoteUrlParser = _MockUpvoteUrlParser();
      hasBeenUpvotedParser = _MockHasBeenUpvotedParser();
      urlHostParser = _MockUrlHostParser();
    });

    DetailTitleRowParser createSubject() {
      return DetailTitleRowParser(
        idParser: idParser,
        titleParser: titleParser,
        urlParser: urlParser,
        upvoteUrlParser: upvoteUrlParser,
        hasBeenUpvotedParser: hasBeenUpvotedParser,
        urlHostParser: urlHostParser,
      );
    }

    group('parse', () {
      final parseId = () => idParser.parse(athing);
      final parseTitle = () => titleParser.parse(athing);
      final parseUrl = () => urlParser.parse(athing);
      final parseUpvoteUrl = () => upvoteUrlParser.parse(athing);
      final parseHasBeenUpvoted = () => hasBeenUpvotedParser.parse(athing);
      final parseUrlHost = () => urlHostParser.parse(athing);

      test('calls parsers and returns $DetailTitleRowData', () {
        when(parseId).thenReturn(id);
        when(parseTitle).thenReturn(title);
        when(parseUrl).thenReturn(url);
        when(parseUpvoteUrl).thenReturn(upvoteUrl);
        when(parseHasBeenUpvoted).thenReturn(hasBeenUpvoted);
        when(parseUrlHost).thenReturn(urlHost);
        final parser = createSubject();
        expect(
          parser.parse(athing),
          DetailTitleRowData.fromParsed(
            id: id,
            title: title,
            url: url,
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
            urlHost: urlHost,
          ),
        );
        verify(parseId).called(1);
        verify(parseTitle).called(1);
        verify(parseUrl).called(1);
        verify(parseUpvoteUrl).called(1);
        verify(parseHasBeenUpvoted).called(1);
        verify(parseUrlHost).called(1);
      });
    });
  });
}
