// ignore_for_file: prefer_const_constructors

import 'package:app/comment_list/comment_list.dart'
    hide Comment, CurrentUserComment, OtherUserComment;
import 'package:app/l10n/l10n.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockCurrentUserComment extends Mock implements CurrentUserComment {}

class _MockOtherUserComment extends Mock implements OtherUserComment {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final locale = Locale('en');
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);
  final appL10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CommentModel, () {
    late CurrentUserComment comment;
    late DateFormatter formatter;

    setUp(() {
      comment = _MockCurrentUserComment();
      formatter = _MockDateFormatter();
    });

    CommentModel createSubject() {
      return CurrentUserCommentModel(
        comment: comment,
        formatter: formatter,
      );
    }

    test('is a ${Collapsible<CommentModel>}', () {
      expect(
        createSubject(),
        isA<Collapsible<CommentModel>>(),
      );
    });

    group('from', () {
      test('returns $OtherUserCommentModel when comment '
          'is $OtherUserComment', () {
        final comment = _MockOtherUserComment();
        expect(
          CommentModel.from(comment),
          OtherUserCommentModel(comment: comment),
        );
      });

      test('returns $CurrentUserCommentModel when comment '
          'is $CurrentUserComment', () {
        final comment = _MockCurrentUserComment();
        expect(
          CommentModel.from(comment),
          CurrentUserCommentModel(comment: comment),
        );
      });
    });

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
  });
}
