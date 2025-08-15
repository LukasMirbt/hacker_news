import 'dart:async';

import 'package:app_client/app_client.dart';

class HtmlInterceptor extends Interceptor {
  final _controller = StreamController<String>.broadcast();
  Stream<String> get stream => _controller.stream;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;

    if (data is String) {
      _controller.add(data);
    }

    handler.next(response);
  }
}
