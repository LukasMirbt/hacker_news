// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/reply/reply.dart'
    hide CurrentUserReplyParent, OtherUserReplyParent, ReplyParent;
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockCurrentUserReplyParent extends Mock
    implements CurrentUserReplyParent {}

class _MockOtherUserReplyParent extends Mock implements OtherUserReplyParent {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final locale = Locale('en');
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);
  final appL10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ReplyParentModel, () {
    late CurrentUserReplyParent parent;
    late DateFormatter formatter;

    setUp(() {
      parent = _MockCurrentUserReplyParent();
      formatter = _MockDateFormatter();
    });

    ReplyParentModel createSubject() {
      return CurrentUserReplyParentModel(
        parent: parent,
        formatter: formatter,
      );
    }

    group('from', () {
      test('returns $OtherUserReplyParentModel when parent '
          'is $OtherUserReplyParent', () {
        final parent = _MockOtherUserReplyParent();
        expect(
          ReplyParentModel.from(parent),
          OtherUserReplyParentModel(parent: parent),
        );
      });

      test('returns $CurrentUserReplyParentModel when parent '
          'is $CurrentUserReplyParent', () {
        final parent = _MockCurrentUserReplyParent();
        expect(
          ReplyParentModel.from(parent),
          CurrentUserReplyParentModel(parent: parent),
        );
      });
    });

    group('id', () {
      test('returns parent.id', () {
        const id = 'id';
        when(() => parent.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
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

    group('toggleExpansion', () {
      test('returns $ReplyParentModel with toggled isExpanded', () {
        final first = createSubject();
        expect(first.isExpanded, true);
        final second = first.toggleExpansion();
        expect(second.isExpanded, false);
        final third = second.toggleExpansion();
        expect(third.isExpanded, true);
      });
    });
  });
}
