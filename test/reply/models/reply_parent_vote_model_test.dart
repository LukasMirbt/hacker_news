// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockOtherUserReplyParentModel extends Mock
    implements OtherUserReplyParentModel {}

class _MockCurrentUserReplyParentModel extends Mock
    implements CurrentUserReplyParentModel {}

void main() {
  final vote = VotePlaceholder();

  group(ReplyParentVoteModel, () {
    ReplyParentVoteModel createSubject() => ReplyParentVoteModel();

    group('updateParent', () {
      test('returns parent when id does not match', () {
        final parent = _MockOtherUserReplyParentModel();
        when(() => parent.id).thenReturn('');
        final model = createSubject();
        expect(
          model.updateParent(vote: vote, parent: parent),
          parent,
        );
      });

      test('throws $ReplyParentVoteFailure when parent '
          'is not $OtherUserReplyParentModel', () {
        final parent = _MockCurrentUserReplyParentModel();
        when(() => parent.id).thenReturn(vote.id);
        final model = createSubject();
        expect(
          () => model.updateParent(vote: vote, parent: parent),
          throwsA(
            ReplyParentVoteFailure(),
          ),
        );
      });

      test('returns updated parent when id matches', () {
        final parent = _MockOtherUserReplyParentModel();
        final updatedHeader = _MockOtherUserReplyParentModel();
        final voteMethod = () => parent.vote(vote.type);
        when(() => parent.id).thenReturn(vote.id);
        when(voteMethod).thenReturn(updatedHeader);
        final model = createSubject();
        expect(
          model.updateParent(vote: vote, parent: parent),
          updatedHeader,
        );
        verify(voteMethod).called(1);
      });
    });
  });
}
