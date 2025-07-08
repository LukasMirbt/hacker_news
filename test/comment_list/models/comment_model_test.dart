// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockComment extends Mock implements Comment {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final locale = Locale('en');
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);
  final appL10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CommentModel, () {
    late Comment comment;
    late DateFormatter formatter;

    setUp(() {
      comment = _MockComment();
      formatter = _MockDateFormatter();
    });

    CommentModel createSubject() {
      return CommentModel(
        comment: comment,
        formatter: formatter,
      );
    }

    group('id', () {
      test('returns comment.id', () {
        const id = 'id';
        when(() => comment.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('indent', () {
      test('returns comment.indent', () {
        const indent = 1;
        when(() => comment.indent).thenReturn(indent);
        final model = createSubject();
        expect(model.indent, indent);
      });
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

    group('user', () {
      test('returns comment.hnuser.id', () {
        const hnuserId = 'hnuserId';
        when(() => comment.hnuser).thenReturn(
          HnuserPlaceholder(id: hnuserId),
        );
        final model = createSubject();
        expect(model.user, hnuserId);
      });
    });

    group('htmlText', () {
      test('returns comment.htmlText', () {
        const htmlText = 'htmlText';
        when(() => comment.htmlText).thenReturn(htmlText);
        final model = createSubject();
        expect(model.htmlText, htmlText);
      });
    });

    group('isTopLevel', () {
      test('returns true when indent is 0', () {
        when(() => comment.indent).thenReturn(0);
        final model = createSubject();
        expect(model.isTopLevel, true);
      });

      test('returns false when indent is not 0', () {
        when(() => comment.indent).thenReturn(1);
        final model = createSubject();
        expect(model.isTopLevel, false);
      });
    });

    group('age', () {
      test('returns correct string', () {
        final age = DateTime(1);
        const formattedAge = 'formattedAge';
        when(() => comment.age).thenReturn(age);
        when(
          () => formatter.format(formatterL10n, age),
        ).thenReturn(formattedAge);
        final model = createSubject();
        expect(
          model.age(appL10n, formatterL10n),
          appL10n.commentList_age(age: formattedAge),
        );
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
        final updatedItem = _MockComment();
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
        final updatedItem = _MockComment();
        when(unvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.unvote),
          model.copyWith(comment: updatedItem),
        );
        verify(unvote).called(1);
      });
    });
  });
}
