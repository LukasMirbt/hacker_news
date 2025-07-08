// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockCommentListModel extends Mock implements CommentListModel {}

class _MockCommentModel extends Mock implements CommentModel {}

void main() {
  final vote = VotePlaceholder();

  group(CommentListVoteModel, () {
    late CommentListModel commentList;
    late CommentModel item;
    late CommentModel updatedItem;
    late CommentListModel updatedCommentList;

    setUp(() {
      commentList = _MockCommentListModel();
      item = _MockCommentModel();
      updatedItem = _MockCommentModel();
      updatedCommentList = _MockCommentListModel();
    });

    CommentListVoteModel createSubject() => CommentListVoteModel();

    group('updateCommentList', () {
      test('returns commentList when findById returns null', () {
        final model = createSubject();
        expect(
          model.updateCommentList(
            vote: vote,
            commentList: commentList,
          ),
          commentList,
        );
      });

      test('returns updated commentList when findById returns item', () {
        final findById = () => commentList.findById(vote.id);
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
    });
  });
}
