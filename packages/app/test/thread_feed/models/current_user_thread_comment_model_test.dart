// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/thread_feed/thread_feed.dart' hide CurrentUserThreadComment;
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

class _MockCurrentUserThreadComment extends Mock
    implements CurrentUserThreadComment {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CurrentUserThreadCommentModel, () {
    late CurrentUserThreadComment comment;
    late DateFormatter formatter;

    setUp(() {
      comment = _MockCurrentUserThreadComment();
      formatter = _MockDateFormatter();
    });

    CurrentUserThreadCommentModel createSubject() {
      return CurrentUserThreadCommentModel(
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

    group('toRepository', () {
      test('returns comment', () {
        final model = createSubject();
        expect(model.toRepository(), comment);
      });
    });

    group('score', () {
      test('returns correct value', () {
        const score = 1;
        when(() => comment.score).thenReturn(score);
        final model = createSubject();
        expect(
          model.score(l10n),
          l10n.commentList_score(score: score),
        );
      });
    });

    group('copyWith', () {
      test('returns $CurrentUserThreadCommentModel with updated fields '
          'when values are non-null', () {
        final updatedThreadComment = _MockCurrentUserThreadComment();
        const updatedIsExpanded = false;
        const updatedIsParentExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            comment: updatedThreadComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
          CurrentUserThreadCommentModel(
            formatter: formatter,
            comment: updatedThreadComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
        );
      });

      test('returns $CurrentUserThreadCommentModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
