// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:collection';

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  group(ProfileUrlParser, () {
    late Document document;
    late Element element;

    setUp(() {
      document = _MockDocument();
      element = _MockElement();
    });

    ProfileUrlParser createSubject() => ProfileUrlParser();

    group('parse', () {
      final getElementById = () => document.getElementById('me');

      test('returns null when element is null', () {
        final parser = createSubject();
        expect(parser.parse(document), null);
      });

      test('returns href attribute when element is non-null', () {
        const href = 'href';
        when(() => element.attributes).thenReturn(
          LinkedHashMap.from({'href': href}),
        );
        when(getElementById).thenReturn(element);
        final parser = createSubject();
        expect(parser.parse(document), href);
      });
    });
  });
}
