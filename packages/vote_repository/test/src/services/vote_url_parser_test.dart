// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:vote_repository/vote_repository.dart';

void main() {
  group(VoteUrlParser, () {
    VoteUrlParser createSubject() => VoteUrlParser();

    group('tryParse', () {
      test('returns null when upvoteUrl is null', () {
        final parser = createSubject();
        expect(
          parser.tryParse(null),
          null,
        );
      });

      test('returns null when upvoteUrl is invalid', () {
        final parser = createSubject();
        expect(
          parser.tryParse(':url'),
          null,
        );
      });

      test('returns null when $Uri does not match pattern', () {
        const upvoteUrl = 'https://www.example.com';
        final parser = createSubject();
        expect(
          parser.tryParse(upvoteUrl),
          null,
        );
      });

      test('returns $ParsedVoteUrl when $Uri matches pattern', () {
        const id = 'id';
        const auth = 'auth';
        const goto = 'goto';
        const upvoteUrl =
            'https://www.example.com?id=$id&auth=$auth&goto=$goto';
        final parser = createSubject();
        expect(
          parser.tryParse(upvoteUrl),
          ParsedVoteUrl(
            id: id,
            auth: auth,
            goto: goto,
            url: Uri.parse(upvoteUrl),
          ),
        );
      });
    });
  });
}
