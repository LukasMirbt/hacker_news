// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart'
    hide Comment, CurrentUserComment;
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockCommentListModel extends Mock implements CommentListModel {}

class _MockOtherUserCommentModel extends Mock
    implements OtherUserCommentModel {}

void main() {
  final form = ReplyFormPlaceholder();
  final comment = CurrentUserCommentDataPlaceholder();

  final update = ReplyUpdate(
    form: form,
    comment: comment,
  );

  final newItem = CurrentUserCommentModel(
    comment: CurrentUserComment.from(comment),
  );

  group(CommentListReplyModel, () {
    late CommentListModel commentList;
    late CommentModel afterItem;
    late CommentListModel updatedCommentList;

    setUp(() {
      commentList = _MockCommentListModel();
      afterItem = _MockOtherUserCommentModel();
      updatedCommentList = _MockCommentListModel();
    });

    CommentListReplyModel createSubject() => CommentListReplyModel();

    group('updateCommentList', () {
      test('throws $CommentListReplyFailure when findById '
          'returns null', () {
        final model = createSubject();
        expect(
          () => model.updateCommentList(
            update: update,
            commentList: commentList,
          ),
          throwsA(
            CommentListReplyFailure(),
          ),
        );
      });

      test('returns updated commentList when findById returns parent', () {
        final findById = () => commentList.findById(form.parentId);
        final insertAfter = () => commentList.insertAfter(
          afterItem: afterItem,
          newItem: newItem,
        );
        when(findById).thenReturn(afterItem);
        when(insertAfter).thenReturn(updatedCommentList);
        final model = createSubject();
        expect(
          model.updateCommentList(
            update: update,
            commentList: commentList,
          ),
          updatedCommentList,
        );
        verify(findById).called(1);
        verify(insertAfter).called(1);
      });
    });
  });
}
