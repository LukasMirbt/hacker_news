// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockUserIdParser extends Mock implements UserIdParser {}

class _MockProfileUrlParser extends Mock implements ProfileUrlParser {}

class _MockKarmaParser extends Mock implements KarmaParser {}

class _MockLogoutUrlParser extends Mock implements LogoutUrlParser {}

class _MockDocument extends Mock implements Document {}

void main() {
  const id = 'id';
  const profileUrl = 'profileUrl';
  const karma = 1;
  const logoutUrl = 'logoutUrl';

  group(UserParser, () {
    late UserIdParser userIdParser;
    late ProfileUrlParser profileUrlParser;
    late KarmaParser karmaParser;
    late LogoutUrlParser logoutUrlParser;
    late Document document;

    setUp(() {
      userIdParser = _MockUserIdParser();
      profileUrlParser = _MockProfileUrlParser();
      karmaParser = _MockKarmaParser();
      logoutUrlParser = _MockLogoutUrlParser();
      document = _MockDocument();
    });

    UserParser createSubject() {
      return UserParser(
        userIdParser: userIdParser,
        profileUrlParser: profileUrlParser,
        karmaParser: karmaParser,
        logoutUrlParser: logoutUrlParser,
      );
    }

    group('parse', () {
      final parseId = () => userIdParser.parse(document);
      final parseProfileUrl = () => profileUrlParser.parse(document);
      final parseKarma = () => karmaParser.parse(document);
      final parseLogoutUrl = () => logoutUrlParser.parse(document);

      test('returns null when id is null', () {
        final parser = createSubject();
        expect(parser.parse(document), null);
        verify(parseId).called(1);
      });

      test('calls parsers and returns $UserData '
          'when id is non-null', () {
        when(parseId).thenReturn(id);
        when(parseProfileUrl).thenReturn(profileUrl);
        when(parseKarma).thenReturn(karma);
        when(parseLogoutUrl).thenReturn(logoutUrl);
        final parser = createSubject();
        expect(
          parser.parse(document),
          UserData.fromParsed(
            id: id,
            profileUrl: profileUrl,
            karma: karma,
            logoutUrl: logoutUrl,
          ),
        );
        verify(parseId).called(1);
        verify(parseProfileUrl).called(1);
        verify(parseKarma).called(1);
        verify(parseLogoutUrl).called(1);
      });
    });
  });
}
