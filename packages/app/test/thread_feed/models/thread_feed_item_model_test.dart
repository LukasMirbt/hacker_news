// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/thread_feed/thread_feed.dart'
    hide CurrentUserThreadComment, OtherUserThreadComment, ThreadComment;
import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

class _MockCurrentUserThreadComment extends Mock
    implements CurrentUserThreadComment {}

class _MockOtherUserThreadComment extends Mock
    implements OtherUserThreadComment {}

class _MockDateFormatter extends Mock implements DateFormatter {}

void main() async {
  final locale = Locale('en');
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);
  final appL10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ThreadCommentModel, () {
    late CurrentUserThreadComment comment;
    late DateFormatter formatter;

    setUp(() {
      comment = _MockCurrentUserThreadComment();
      formatter = _MockDateFormatter();
    });

    ThreadCommentModel createSubject() {
      return CurrentUserThreadCommentModel(
        comment: comment,
        formatter: formatter,
      );
    }

    test('is a ${Collapsible<ThreadCommentModel>}', () {
      expect(
        createSubject(),
        isA<Collapsible<ThreadCommentModel>>(),
      );
    });

    group('from', () {
      test('returns $OtherUserThreadCommentModel when comment '
          'is $OtherUserThreadComment', () {
        final comment = _MockOtherUserThreadComment();
        expect(
          ThreadCommentModel.from(comment),
          OtherUserThreadCommentModel(comment: comment),
        );
      });

      test('returns $CurrentUserThreadCommentModel when comment '
          'is $CurrentUserThreadComment', () {
        final comment = _MockCurrentUserThreadComment();
        expect(
          ThreadCommentModel.from(comment),
          CurrentUserThreadCommentModel(comment: comment),
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
