import 'package:flutter_test/flutter_test.dart';
import 'package:vote_repository/vote_repository.dart';

void main() {
  const id = 'id';
  const auth = 'auth';
  const goto = 'goto';
  final url = Uri.parse(
    'https://www.example.com?id=$id&auth=$auth&goto=$goto',
  );

  group(ParsedVoteUrl, () {
    ParsedVoteUrl createSubject() {
      return ParsedVoteUrl(
        id: id,
        auth: auth,
        goto: goto,
        url: url,
      );
    }

    group('toUrl', () {
      test('returns correct $Uri when type is ${VoteType.upvote}', () {
        final model = createSubject();
        final upvoteUrl = model.toUrl(VoteType.upvote);
        expect(
          upvoteUrl,
          url.replace(
            queryParameters: {
              ...url.queryParameters,
              'how': 'up',
            },
          ),
        );
      });

      test('returns correct $Uri when type is ${VoteType.unvote}', () {
        final model = createSubject();
        final unvoteUrl = model.toUrl(VoteType.unvote);
        expect(
          unvoteUrl,
          url.replace(
            queryParameters: {
              ...url.queryParameters,
              'how': 'un',
            },
          ),
        );
      });
    });
  });
}
