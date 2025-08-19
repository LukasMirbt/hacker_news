// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationStatusParser extends Mock
    implements AuthenticationStatusParser {}

void main() {
  group(AuthenticationStatusService, () {
    late AuthenticationStatusParser parser;

    setUp(() {
      parser = _MockAuthenticationStatusParser();
    });

    AuthenticationStatusService createSubject() {
      return AuthenticationStatusService(
        authenticationStatusParser: parser,
      );
    }

    group('update', () {
      const html = 'html';
      final status = Unauthenticated();
      final parse = () => parser.parse(html);

      test('calls parser and emits status', () {
        when(parse).thenReturn(status);
        final service = createSubject();
        service.update(html);
        expect(service.status, emits(status));
        verify(parse).called(1);
      });
    });
  });
}
