import 'package:flutter_test/flutter_test.dart';
import 'package:post_api/post_api.dart';

void main() {
  group(StreamAggregator, () {
    StreamAggregator createSubject() => StreamAggregator();

    group('aggregate', () {
      test('aggregates stream of strings '
          'by mutating a single buffer', () async {
        const firstChunk = 'firstChunk';
        const secondChunk = 'secondChunk';

        final stream = Stream<String>.fromIterable(
          [firstChunk, secondChunk],
        );

        final aggregator = createSubject();
        final aggregatedStream = aggregator.aggregate(stream);

        final buffers = <StringBuffer>[];
        final results = <String>[];

        await for (final buffer in aggregatedStream) {
          buffers.add(buffer);
          results.add(buffer.toString());
        }

        expect(
          identical(buffers[0], buffers[1]),
          true,
        );

        expect(
          results,
          [
            firstChunk,
            '$firstChunk$secondChunk',
          ],
        );
      });
    });
  });
}
