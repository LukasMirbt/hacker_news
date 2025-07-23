// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyForm extends Mock implements ReplyForm {}

void main() {
  group(ReplyFormModel, () {
    late ReplyForm form;

    setUp(() {
      form = _MockReplyForm();
    });

    ReplyFormModel createSubject() => ReplyFormModel(form);

    group('user', () {
      test('returns form.hnuser.id', () {
        const user = 'user';
        when(() => form.hnuser).thenReturn(
          HnuserPlaceholder(id: user),
        );
        final model = createSubject();
        expect(model.user, user);
      });
    });

    group('htmlText', () {
      test('returns form.htmlText', () {
        const htmlText = 'htmlText';
        when(() => form.htmlText).thenReturn(htmlText);
        final model = createSubject();
        expect(model.htmlText, htmlText);
      });
    });

    group('toRepository', () {
      test('returns form', () {
        final model = createSubject();
        expect(model.toRepository(), form);
      });
    });
  });
}
