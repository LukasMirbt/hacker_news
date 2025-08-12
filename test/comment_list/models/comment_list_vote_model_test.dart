// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockCommentListModel extends Mock implements CommentListModel {}

class _MockOtherUserCommentModel extends Mock
    implements OtherUserCommentModel {}

class _MockCurrentUserCommentModel extends Mock
    implements CurrentUserCommentModel {}

void main() {
  final vote = VotePlaceholder();

  group(CommentListVoteModel, () {
    late CommentListModel commentList;
    late OtherUserCommentModel item;
    late OtherUserCommentModel updatedItem;
    late CommentListModel updatedCommentList;

    setUp(() {
      commentList = _MockCommentListModel();
      item = _MockOtherUserCommentModel();
      updatedItem = _MockOtherUserCommentModel();
      updatedCommentList = _MockCommentListModel();
    });

    CommentListVoteModel createSubject() => CommentListVoteModel();

    group('updateCommentList', () {
      final findById = () => commentList.findById(vote.id);

      test('returns commentList when findById returns null', () {
        final model = createSubject();
        expect(
          model.updateCommentList(
            vote: vote,
            commentList: commentList,
          ),
          commentList,
        );
        verify(findById).called(1);
      });

      test('returns updated commentList when findById returns item', () {
        final voteMethod = () => item.vote(vote.type);
        final update = () => commentList.update(updatedItem);
        when(findById).thenReturn(item);
        when(voteMethod).thenReturn(updatedItem);
        when(update).thenReturn(updatedCommentList);
        final model = createSubject();
        expect(
          model.updateCommentList(
            vote: vote,
            commentList: commentList,
          ),
          updatedCommentList,
        );
        verify(findById).called(1);
        verify(voteMethod).called(1);
        verify(update).called(1);
      });

      test('throws $CurrentUserVoteError when findById '
          'returns $CurrentUserCommentModel', () {
        when(findById).thenReturn(_MockCurrentUserCommentModel());
        final model = createSubject();
        expect(
          () => model.updateCommentList(
            vote: vote,
            commentList: commentList,
          ),
          throwsA(
            CurrentUserVoteError(),
          ),
        );
        verify(findById).called(1);
      });
    });
  });
}
