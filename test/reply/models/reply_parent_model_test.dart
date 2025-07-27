// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart' hide ReplyParent;
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockReplyParent extends Mock implements ReplyParent {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final locale = Locale('en');
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);
  final appL10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ReplyParentModel, () {
    late ReplyParent parent;
    late DateFormatter formatter;

    setUp(() {
      parent = _MockReplyParent();
      formatter = _MockDateFormatter();
    });

    ReplyParentModel createSubject() {
      return ReplyParentModel(
        parent: parent,
        formatter: formatter,
      );
    }

    group('id', () {
      test('returns parent.id', () {
        const id = 'id';
        when(() => parent.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
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

    group('user', () {
      test('returns parent.hnuser.id', () {
        const hnuserId = 'hnuserId';
        when(() => parent.hnuser).thenReturn(
          HnuserPlaceholder(id: hnuserId),
        );
        final model = createSubject();
        expect(model.user, hnuserId);
      });
    });

    group('htmlText', () {
      test('returns parent.htmlText', () {
        const htmlText = 'htmlText';
        when(() => parent.htmlText).thenReturn(htmlText);
        final model = createSubject();
        expect(model.htmlText, htmlText);
      });
    });

    group('age', () {
      test('returns correct string', () {
        final age = DateTime(1);
        const formattedAge = 'formattedAge';
        when(() => parent.age).thenReturn(age);
        when(
          () => formatter.format(formatterL10n, age),
        ).thenReturn(formattedAge);
        final model = createSubject();
        expect(
          model.age(appL10n, formatterL10n),
          appL10n.reply_age(age: formattedAge),
        );
      });
    });

    group('vote', () {
      final upvote = () => parent.upvote();
      final unvote = () => parent.unvote();

      test('returns upvoted item when type '
          'is ${VoteType.upvote}', () {
        final updatedItem = _MockReplyParent();
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
        final updatedItem = _MockReplyParent();
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
      test('returns $ReplyParentModel with updated fields '
          'when values are non-null', () {
        final updatedReplyParent = _MockReplyParent();
        const updatedIsExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            parent: updatedReplyParent,
            isExpanded: updatedIsExpanded,
          ),
          ReplyParentModel(
            formatter: formatter,
            parent: updatedReplyParent,
            isExpanded: updatedIsExpanded,
          ),
        );
      });

      test('returns $ReplyParentModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
