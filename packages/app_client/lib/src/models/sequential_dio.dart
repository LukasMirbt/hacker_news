import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:mutex/mutex.dart';

// The Hacker News web API rate limits requests so aggressively
// that it essentially does not support concurrent requests.
// This Dio client ensures that requests are made sequentially.
class SequentialDio extends DioForNative {
  SequentialDio({
    Mutex? mutex,
    HttpClientAdapter? httpClientAdapter,
  }) : _mutex = mutex ?? Mutex() {
    this.httpClientAdapter = httpClientAdapter ?? IOHttpClientAdapter();
  }

  final Mutex _mutex;

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    return _mutex.protect(() {
      return super.fetch<T>(requestOptions);
    });
  }
}
