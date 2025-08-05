// ignore_for_file: prefer_const_constructors

import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart' hide CurrentUserReplyParent;
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockCurrentUserReplyParent extends Mock
    implements CurrentUserReplyParent {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CurrentUserReplyParentModel, () {
    late CurrentUserReplyParent parent;
    late DateFormatter formatter;

    setUp(() {
      parent = _MockCurrentUserReplyParent();
      formatter = _MockDateFormatter();
    });

    CurrentUserReplyParentModel createSubject() {
      return CurrentUserReplyParentModel(
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

    group('toRepository', () {
      test('returns parent', () {
        final model = createSubject();
        expect(model.toRepository(), parent);
      });
    });

    group('score', () {
      test('returns correct value', () {
        const score = 1;
        when(() => parent.score).thenReturn(score);
        final model = createSubject();
        expect(
          model.score(l10n),
          l10n.reply_score(score: score),
        );
      });
    });

    group('copyWith', () {
      test('returns $CurrentUserReplyParentModel with updated fields '
          'when values are non-null', () {
        final updatedReplyParent = _MockCurrentUserReplyParent();
        const updatedIsExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            parent: updatedReplyParent,
            isExpanded: updatedIsExpanded,
          ),
          CurrentUserReplyParentModel(
            formatter: formatter,
            parent: updatedReplyParent,
            isExpanded: updatedIsExpanded,
          ),
        );
      });

      test('returns $CurrentUserReplyParentModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
