// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/thread_feed/thread_feed.dart' hide OtherUserThreadComment;
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockOtherUserThreadComment extends Mock
    implements OtherUserThreadComment {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() {
  group(OtherUserThreadCommentModel, () {
    late OtherUserThreadComment comment;
    late DateFormatter formatter;

    setUp(() {
      comment = _MockOtherUserThreadComment();
      formatter = _MockDateFormatter();
    });

    OtherUserThreadCommentModel createSubject() {
      return OtherUserThreadCommentModel(
        comment: comment,
        formatter: formatter,
      );
    }

    test('is a $ThreadCommentModel', () {
      expect(
        createSubject(),
        isA<ThreadCommentModel>(),
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
        final updatedItem = _MockOtherUserThreadComment();
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
        final updatedItem = _MockOtherUserThreadComment();
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
      test('returns $OtherUserThreadCommentModel with updated fields '
          'when values are non-null', () {
        final updatedThreadComment = _MockOtherUserThreadComment();
        const updatedIsExpanded = false;
        const updatedIsParentExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            comment: updatedThreadComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
          OtherUserThreadCommentModel(
            formatter: formatter,
            comment: updatedThreadComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
        );
      });

      test('returns $OtherUserThreadCommentModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
