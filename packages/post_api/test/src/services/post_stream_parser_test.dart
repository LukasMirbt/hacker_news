// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_api/post_api.dart';

class _MockUtf8StreamDecoder extends Mock implements Utf8StreamDecoder {}

class _MockStreamAggregator extends Mock implements StreamAggregator {}

class _MockStreamSampler extends Mock implements StreamSampler {}

class _MockPostBufferParser extends Mock implements PostBufferParser {}

void main() {
  group(PostStreamParser, () {
    late Utf8StreamDecoder decoder;
    late StreamAggregator aggregator;
    late StreamSampler sampler;
    late PostBufferParser parser;

    setUp(() {
      decoder = _MockUtf8StreamDecoder();
      aggregator = _MockStreamAggregator();
      sampler = _MockStreamSampler();
      parser = _MockPostBufferParser();
    });

    PostStreamParser createSubject() {
      return PostStreamParser(
        utf8StreamDecoder: decoder,
        streamAggregator: aggregator,
        streamSampler: sampler,
        postBufferParser: parser,
      );
    }

    group('parse', () {
      final stream = Stream<Uint8List>.empty();
      final utf8Stream = Stream<String>.empty();
      final aggregatedStream = Stream<StringBuffer>.empty();
      final sampledStream = Stream<PostData>.empty();

      final decode = () => decoder.decode(stream);
      final aggregate = () => aggregator.aggregate(utf8Stream);
      final sample = () => sampler.sample(aggregatedStream, parser.parse);

      test('decodes, aggregated and samples stream', () {
        when(decode).thenAnswer((_) => utf8Stream);
        when(aggregate).thenAnswer((_) => aggregatedStream);
        when(sample).thenAnswer((_) => sampledStream);
        final streamParser = createSubject();
        expect(streamParser.parse(stream), sampledStream);
        verify(decode).called(1);
        verify(aggregate).called(1);
        verify(sample).called(1);
      });
    });
  });
}
