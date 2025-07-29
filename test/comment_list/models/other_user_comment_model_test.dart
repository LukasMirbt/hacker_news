// ignore_for_file: prefer_function_declarations_over_variables

import 'package:date_formatter/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart'
    hide OtherUserComment;
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockOtherUserComment extends Mock implements OtherUserComment {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() {
  group(OtherUserCommentModel, () {
    late OtherUserComment comment;
    late DateFormatter formatter;

    setUp(() {
      comment = _MockOtherUserComment();
      formatter = _MockDateFormatter();
    });

    OtherUserCommentModel createSubject() {
      return OtherUserCommentModel(
        comment: comment,
        formatter: formatter,
      );
    }

    test('is a $CommentModel', () {
      expect(
        createSubject(),
        isA<CommentModel>(),
      );
    });

    group('upvoteUrl', () {
      test('returns comment.upvoteUrl', () {
        const upvoteUrl = 'upvoteUrl';
        when(() => comment.upvoteUrl).thenReturn(upvoteUrl);
        final model = createSubject();
        expect(model.upvoteUrl, upvoteUrl);
      });
    });

    group('hasBeenUpvoted', () {
      test('returns comment.hasBeenUpvoted', () {
        const hasBeenUpvoted = true;
        when(() => comment.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final model = createSubject();
        expect(model.hasBeenUpvoted, hasBeenUpvoted);
      });
    });

    group('toRepository', () {
      test('returns comment', () {
        final model = createSubject();
        expect(model.toRepository(), comment);
      });
    });

    group('vote', () {
      final upvote = () => comment.upvote();
      final unvote = () => comment.unvote();

      test('returns upvoted item when type '
          'is ${VoteType.upvote}', () {
        final updatedItem = _MockOtherUserComment();
        when(upvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.upvote),
          model.copyWith(comment: updatedItem),
        );
        verify(upvote).called(1);
      });

      test('returns unvoted item when type '
          'is ${VoteType.unvote}', () {
        final updatedItem = _MockOtherUserComment();
        when(unvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.unvote),
          model.copyWith(comment: updatedItem),
        );
        verify(unvote).called(1);
      });
    });

    group('copyWith', () {
      test('returns $OtherUserCommentModel with updated fields '
          'when values are non-null', () {
        final updatedComment = _MockOtherUserComment();
        const updatedIsExpanded = false;
        const updatedIsParentExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            comment: updatedComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
          OtherUserCommentModel(
            formatter: formatter,
            comment: updatedComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
        );
      });

      test('returns $OtherUserCommentModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
