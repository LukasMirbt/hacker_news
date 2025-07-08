import 'package:stream_transform/stream_transform.dart';

class StreamSampler {
  const StreamSampler();

  Stream<T> sample<T>(
    Stream<StringBuffer> stream,
    Future<T> Function(StringBuffer buffer) callback,
  ) {
    return stream.asyncMapSample(callback);
  }
}
