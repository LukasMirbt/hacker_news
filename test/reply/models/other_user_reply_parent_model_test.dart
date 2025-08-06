// ignore_for_file: prefer_function_declarations_over_variables

import 'package:date_formatter/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart' hide OtherUserReplyParent;
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockOtherUserReplyParent extends Mock implements OtherUserReplyParent {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() {
  group(OtherUserReplyParentModel, () {
    late OtherUserReplyParent parent;
    late DateFormatter formatter;

    setUp(() {
      parent = _MockOtherUserReplyParent();
      formatter = _MockDateFormatter();
    });

    OtherUserReplyParentModel createSubject() {
      return OtherUserReplyParentModel(
        parent: parent,
        formatter: formatter,
      );
    }

    test('is a $ReplyParentModel', () {
      expect(
        createSubject(),
        isA<ReplyParentModel>(),
      );
    });

    group('upvoteUrl', () {
      test('returns parent.upvoteUrl', () {
        const upvoteUrl = 'upvoteUrl';
        when(() => parent.upvoteUrl).thenReturn(upvoteUrl);
        final model = createSubject();
        expect(model.upvoteUrl, upvoteUrl);
      });
    });

    group('hasBeenUpvoted', () {
      test('returns parent.hasBeenUpvoted', () {
        const hasBeenUpvoted = true;
        when(() => parent.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final model = createSubject();
        expect(model.hasBeenUpvoted, hasBeenUpvoted);
      });
    });

    group('toRepository', () {
      test('returns parent', () {
        final model = createSubject();
        expect(model.toRepository(), parent);
      });
    });

    group('vote', () {
      final upvote = () => parent.upvote();
      final unvote = () => parent.unvote();

      test('returns upvoted item when type '
          'is ${VoteType.upvote}', () {
        final updatedItem = _MockOtherUserReplyParent();
        when(upvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.upvote),
          model.copyWith(parent: updatedItem),
        );
        verify(upvote).called(1);
      });

      test('returns unvoted item when type '
          'is ${VoteType.unvote}', () {
        final updatedItem = _MockOtherUserReplyParent();
        when(unvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.unvote),
          model.copyWith(parent: updatedItem),
        );
        verify(unvote).called(1);
      });
    });

    group('copyWith', () {
      test('returns $OtherUserReplyParentModel with updated fields '
          'when values are non-null', () {
        final updatedReplyParent = _MockOtherUserReplyParent();
        const updatedIsExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            parent: updatedReplyParent,
            isExpanded: updatedIsExpanded,
          ),
          OtherUserReplyParentModel(
            formatter: formatter,
            parent: updatedReplyParent,
            isExpanded: updatedIsExpanded,
          ),
        );
      });

      test('returns $OtherUserReplyParentModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
