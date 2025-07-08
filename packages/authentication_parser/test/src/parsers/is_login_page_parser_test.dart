// ignore_for_file: prefer_const_constructors

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  group(IsLoginPageParser, () {
    late Document document;

    setUp(() {
      document = _MockDocument();
    });

    IsLoginPageParser createSubject() => IsLoginPageParser();

    group('parse', () {
      test('returns true when acctInput and pwInput are non-null', () {
        final acctInput = _MockElement();
        final pwInput = _MockElement();
        when(
          () => document.querySelector('input[name="acct"]'),
        ).thenReturn(acctInput);
        when(
          () => document.querySelector('input[name="pw"]'),
        ).thenReturn(pwInput);
        final parser = createSubject();
        final isLoginPage = parser.parse(document);
        expect(isLoginPage, true);
      });

      test('returns false when acctInput and pwInput are null', () {
        final parser = createSubject();
        final isLoginPage = parser.parse(document);
        expect(isLoginPage, false);
      });
    });
  });
}
