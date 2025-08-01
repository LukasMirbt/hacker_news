// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockUserParser extends Mock implements UserParser {}

class _MockHasLoginLinkParser extends Mock implements HasLoginLinkParser {}

class _MockDocument extends Mock implements Document {}

class _MockUserData extends Mock implements UserData {}

void main() {
  group(AuthenticationStatusParser, () {
    late UserParser userParser;
    late HasLoginLinkParser hasLoginLinkParser;
    late Document document;
    late UserData user;

    setUp(() {
      userParser = _MockUserParser();
      hasLoginLinkParser = _MockHasLoginLinkParser();
      document = _MockDocument();
      user = _MockUserData();
    });

    AuthenticationStatusParser createSubject() {
      return AuthenticationStatusParser(
        userParser: userParser,
        hasLoginLinkParser: hasLoginLinkParser,
      );
    }

    group('parse', () {
      final parseUserData = () => userParser.parse(document);
      final parseHasLoginLink = () => hasLoginLinkParser.parse(document);

      test('returns $Authenticated when user is non-null', () {
        when(parseUserData).thenReturn(user);
        final parser = createSubject();
        expect(
          parser.parse(document),
          Authenticated(user),
        );
        verify(parseUserData).called(1);
      });

      test('returns $Unauthenticated when user is null '
          'and hasLoginLink', () {
        when(parseHasLoginLink).thenReturn(true);
        final parser = createSubject();
        expect(
          parser.parse(document),
          Unauthenticated(),
        );
        verify(parseUserData).called(1);
        verify(parseHasLoginLink).called(1);
      });

      test('returns $Unknown when user is null '
          'and !hasLoginLink', () {
        when(parseHasLoginLink).thenReturn(false);
        final parser = createSubject();
        expect(
          parser.parse(document),
          Unknown(),
        );
        verify(parseUserData).called(1);
        verify(parseHasLoginLink).called(1);
      });
    });
  });
}
