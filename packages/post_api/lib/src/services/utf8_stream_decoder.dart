import 'dart:convert';
import 'dart:typed_data';

class Utf8StreamDecoder {
  const Utf8StreamDecoder();

  Stream<String> decode(Stream<Uint8List> stream) {
    final intListStream = stream.cast<List<int>>();
    final utf8Stream = intListStream.transform(utf8.decoder);
    return utf8Stream;
  }
}
