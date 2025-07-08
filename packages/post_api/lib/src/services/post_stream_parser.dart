import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:post_api/post_api.dart';

class PostStreamParser {
  const PostStreamParser({
    Utf8StreamDecoder? utf8StreamDecoder,
    StreamAggregator? streamAggregator,
    StreamSampler? streamSampler,
    PostBufferParser? postBufferParser,
  }) : _decoder = utf8StreamDecoder ?? const Utf8StreamDecoder(),
       _aggregator = streamAggregator ?? const StreamAggregator(),
       _sampler = streamSampler ?? const StreamSampler(),
       _parser = postBufferParser ?? const PostBufferParser();

  final Utf8StreamDecoder _decoder;
  final StreamAggregator _aggregator;
  final StreamSampler _sampler;
  final PostBufferParser _parser;

  Stream<PostData> parse(Stream<Uint8List> stream) {
    final utf8Stream = _decoder.decode(stream);
    final aggregatedStream = _aggregator.aggregate(utf8Stream);
    final sampledStream = _sampler.sample(aggregatedStream, _parser.parse);
    return sampledStream;
  }
}
