import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:post_api/post_api.dart';

void main() {
  group(Utf8StreamDecoder, () {
    Utf8StreamDecoder createSubject() => Utf8StreamDecoder();

    group('decode', () {
      test('returns decoded stream', () {
        const hello = 'hello';
        final helloBytes = utf8.encode(hello);

        const world = 'world';
        final worldBytes = utf8.encode(world);

        final chunks = [helloBytes, worldBytes];

        final stream = Stream.fromIterable(chunks);
        final decoder = createSubject();

        expect(
          decoder.decode(stream),
          emitsInOrder([hello, world]),
        );
      });
    });
  });
}
