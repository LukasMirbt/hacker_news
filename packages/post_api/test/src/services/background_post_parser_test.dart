// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_api/post_api.dart';

class _MockPostParser extends Mock implements PostParser {}

void main() {
  group('parsePost', () {
    late PostParser parser;

    setUp(() {
      parser = _MockPostParser();
      when(() => parser.parse(any())).thenReturn(PostData.empty);
    });

    test('calls parse', () {
      const partialHtml = 'partialHtml';
      final post = PostDataPlaceholder();
      final parse = () => parser.parse(partialHtml);
      when(parse).thenReturn(post);
      expect(
        parsePost(partialHtml, parser: parser),
        post,
      );
      verify(parse).called(1);
    });
  });

  group(BackgroundPostParser, () {
    BackgroundPostParser createSubject(ParsePostCallback callback) {
      return BackgroundPostParser(callback: callback);
    }

    group('parse', () {
      test('calls callback and returns result', () async {
        const html = 'html';
        final post = PostDataPlaceholder();

        final callback = (String value) {
          if (value != html) {
            throw TestFailure('parameter is incorrect');
          }
          return PostDataPlaceholder();
        };

        final parser = createSubject(callback);

        await expectLater(
          parser.parse(html),
          completion(post),
        );
      });
    });
  });
}
