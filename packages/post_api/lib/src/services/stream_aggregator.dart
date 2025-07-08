import 'package:stream_transform/stream_transform.dart';

class StreamAggregator {
  const StreamAggregator();

  Stream<StringBuffer> aggregate(Stream<String> stream) {
    return stream.scan(
      StringBuffer(),
      (buffer, chunk) {
        buffer.write(chunk);
        return buffer;
      },
    );
  }
}
