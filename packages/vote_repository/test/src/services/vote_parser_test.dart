// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockVoteUrlParser extends Mock implements VoteUrlParser {}

class _MockParsedVoteUrl extends Mock implements ParsedVoteUrl {}

void main() {
  const id = 'id';

  group(VoteParser, () {
    late VoteUrlParser urlParser;
    late ParsedVoteUrl parsedUrl;

    setUp(() {
      urlParser = _MockVoteUrlParser();
      parsedUrl = _MockParsedVoteUrl();
      when(() => parsedUrl.id).thenReturn(id);
    });

    VoteParser createSubject() {
      return VoteParser(urlParser: urlParser);
    }

    group('tryParse', () {
      const upvoteUrl = 'upvotUrl';
      final url = Uri.parse('https://www.example.com');
      const hasBeenUpvoted = true;
      final tryParse = () => urlParser.tryParse(upvoteUrl);

      test('returns null when urlParser returns null', () {
        final parser = createSubject();
        expect(
          parser.tryParse(
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          null,
        );
      });

      test('returns correct $Vote when urlParser '
          'returns $ParsedVoteUrl and hasBeenUpvoted', () {
        const type = VoteType.unvote;
        when(tryParse).thenReturn(parsedUrl);
        when(
          () => parsedUrl.toUrl(type),
        ).thenReturn(url);
        final parser = createSubject();
        expect(
          parser.tryParse(
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          Vote(
            id: id,
            url: url,
            type: type,
          ),
        );
      });

      test('returns correct $Vote when urlParser '
          'returns $ParsedVoteUrl and !hasBeenUpvoted', () {
        const hasBeenUpvoted = false;
        const type = VoteType.upvote;
        when(tryParse).thenReturn(parsedUrl);
        when(
          () => parsedUrl.toUrl(type),
        ).thenReturn(url);
        final parser = createSubject();
        expect(
          parser.tryParse(
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          ),
          Vote(
            id: id,
            url: url,
            type: type,
          ),
        );
      });
    });
  });
}
