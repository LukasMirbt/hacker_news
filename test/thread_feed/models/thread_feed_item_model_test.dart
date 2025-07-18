// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart' hide ThreadFeedItem;
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockThreadFeedItem extends Mock implements ThreadFeedItem {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final locale = Locale('en');
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);
  final appL10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ThreadFeedItemModel, () {
    late ThreadFeedItem item;
    late DateFormatter formatter;

    setUp(() {
      item = _MockThreadFeedItem();
      formatter = _MockDateFormatter();
    });

    ThreadFeedItemModel createSubject() {
      return ThreadFeedItemModel(
        item: item,
        formatter: formatter,
      );
    }

    test('is ${Collapsible<ThreadFeedItemModel>}', () {
      expect(
        createSubject(),
        isA<Collapsible<ThreadFeedItemModel>>(),
      );
    });

    group('id', () {
      test('returns item.id', () {
        const id = 'id';
        when(() => item.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('indent', () {
      test('returns item.indent', () {
        const indent = 1;
        when(() => item.indent).thenReturn(indent);
        final model = createSubject();
        expect(model.indent, indent);
      });
    });

    group('upvoteUrl', () {
      test('returns item.upvoteUrl', () {
        const upvoteUrl = 'upvoteUrl';
        when(() => item.upvoteUrl).thenReturn(upvoteUrl);
        final model = createSubject();
        expect(model.upvoteUrl, upvoteUrl);
      });
    });

    group('hasBeenUpvoted', () {
      test('returns item.hasBeenUpvoted', () {
        const hasBeenUpvoted = true;
        when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final model = createSubject();
        expect(model.hasBeenUpvoted, hasBeenUpvoted);
      });
    });

    group('user', () {
      test('returns item.hnuser.id', () {
        const hnuserId = 'hnuserId';
        when(() => item.hnuser).thenReturn(
          HnuserPlaceholder(id: hnuserId),
        );
        final model = createSubject();
        expect(model.user, hnuserId);
      });
    });

    group('htmlText', () {
      test('returns item.htmlText', () {
        const htmlText = 'htmlText';
        when(() => item.htmlText).thenReturn(htmlText);
        final model = createSubject();
        expect(model.htmlText, htmlText);
      });
    });

    group('isTopLevel', () {
      test('returns true when indent is 0', () {
        when(() => item.indent).thenReturn(0);
        final model = createSubject();
        expect(model.isTopLevel, true);
      });

      test('returns false when indent is not 0', () {
        when(() => item.indent).thenReturn(1);
        final model = createSubject();
        expect(model.isTopLevel, false);
      });
    });

    group('toRepository', () {
      test('returns item', () {
        final model = createSubject();
        expect(model.toRepository(), item);
      });
    });

    group('age', () {
      test('returns correct string', () {
        final age = DateTime(1);
        const formattedAge = 'formattedAge';
        when(() => item.age).thenReturn(age);
        when(
          () => formatter.format(formatterL10n, age),
        ).thenReturn(formattedAge);
        final model = createSubject();
        expect(
          model.age(appL10n, formatterL10n),
          appL10n.threadFeed_age(age: formattedAge),
        );
      });
    });

    group('vote', () {
      final upvote = () => item.upvote();
      final unvote = () => item.unvote();

      test('returns upvoted item when type '
          'is ${VoteType.upvote}', () {
        final updatedItem = _MockThreadFeedItem();
        when(upvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.upvote),
          model.copyWith(item: updatedItem),
        );
        verify(upvote).called(1);
      });

      test('returns unvoted item when type '
          'is ${VoteType.unvote}', () {
        final updatedItem = _MockThreadFeedItem();
        when(unvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.unvote),
          model.copyWith(item: updatedItem),
        );
        verify(unvote).called(1);
      });
    });

    group('copyWith', () {
      test('returns $ThreadFeedItemModel with updated fields '
          'when values are non-null', () {
        final updatedItem = _MockThreadFeedItem();
        const updatedIsExpanded = false;
        const updatedIsParentExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            item: updatedItem,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
          ThreadFeedItemModel(
            formatter: formatter,
            item: updatedItem,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
        );
      });

      test('returns $ThreadFeedItemModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
