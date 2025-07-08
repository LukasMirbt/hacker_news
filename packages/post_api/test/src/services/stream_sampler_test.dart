// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:post_api/post_api.dart';

void main() {
  group(StreamSampler, () {
    StreamSampler createSubject() => StreamSampler();

    group('sample', () {
      test('returns correct stream', () {
        final buffer = StringBuffer();
        final post = PostDataPlaceholder();
        final stream = Stream.value(buffer);

        final callback = (_) async => post;

        final sampler = createSubject();

        expect(
          sampler.sample(stream, callback),
          emits(post),
        );
      });
    });
  });
}
