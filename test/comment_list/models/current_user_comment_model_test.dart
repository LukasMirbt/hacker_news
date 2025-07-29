// ignore_for_file: prefer_const_constructors

import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart'
    hide CurrentUserComment;
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockCurrentUserComment extends Mock implements CurrentUserComment {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CurrentUserCommentModel, () {
    late CurrentUserComment comment;
    late DateFormatter formatter;

    setUp(() {
      comment = _MockCurrentUserComment();
      formatter = _MockDateFormatter();
    });

    CurrentUserCommentModel createSubject() {
      return CurrentUserCommentModel(
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
      test('returns $CurrentUserCommentModel with updated fields '
          'when values are non-null', () {
        final updatedComment = _MockCurrentUserComment();
        const updatedIsExpanded = false;
        const updatedIsParentExpanded = false;
        final model = createSubject();
        expect(
          model.copyWith(
            comment: updatedComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
          CurrentUserCommentModel(
            formatter: formatter,
            comment: updatedComment,
            isExpanded: updatedIsExpanded,
            isParentExpanded: updatedIsParentExpanded,
          ),
        );
      });

      test('returns $CurrentUserCommentModel with previous fields '
          'when values are null', () {
        final model = createSubject();
        expect(model.copyWith(), model);
      });
    });
  });
}
