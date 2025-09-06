// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/post_header/post_header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockPostHeaderModel extends Mock implements PostHeaderModel {}

void main() {
  final vote = VotePlaceholder();

  group(PostHeaderVoteModel, () {
    PostHeaderVoteModel createSubject() => PostHeaderVoteModel();

    group('updateHeader', () {
      test('returns header when id does not match', () {
        final header = _MockPostHeaderModel();
        when(() => header.id).thenReturn('');
        final model = createSubject();
        expect(
          model.updateHeader(vote: vote, header: header),
          header,
        );
      });

      test('returns updated header when id matches', () {
        final header = _MockPostHeaderModel();
        final updatedHeader = _MockPostHeaderModel();
        final voteMethod = () => header.vote(vote.type);
        when(() => header.id).thenReturn(vote.id);
        when(voteMethod).thenReturn(updatedHeader);
        final model = createSubject();
        expect(
          model.updateHeader(vote: vote, header: header),
          updatedHeader,
        );
        verify(voteMethod).called(1);
      });
    });
  });
}
