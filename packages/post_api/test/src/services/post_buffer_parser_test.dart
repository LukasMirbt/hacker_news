// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_api/post_api.dart';

class _MockBackgroundPostParser extends Mock implements BackgroundPostParser {}

void main() {
  group(PostBufferParser, () {
    late BackgroundPostParser parser;

    setUp(() {
      parser = _MockBackgroundPostParser();
    });

    PostBufferParser createSubject() {
      return PostBufferParser(parser: parser);
    }

    group('parse', () {
      test('calls parse and returns post', () {
        final buffer = StringBuffer('html');
        final html = buffer.toString();
        final post = PostDataPlaceholder();
        final parse = () => parser.parse(html);
        when(parse).thenAnswer((_) async => post);
        final bufferParser = createSubject();
        expect(
          bufferParser.parse(buffer),
          completion(post),
        );
        verify(parse).called(1);
      });
    });
  });
}
