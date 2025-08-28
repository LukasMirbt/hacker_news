// ignore_for_file: use_setters_to_change_properties

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppWebViewController {
  late InAppWebViewController _controller;

  void initialize(InAppWebViewController controller) {
    _controller = controller;
  }

  Future<bool> canGoBack() => _controller.canGoBack();

  Future<bool> canGoForward() => _controller.canGoForward();

  Future<String?> title() => _controller.getTitle();

  Future<Uri?> url() async {
    final webUrl = await _controller.getUrl();
    return webUrl?.uriValue;
  }

  void goBack() {
    _controller.goBack();
  }

  void goForward() {
    _controller.goForward();
  }

  void reload() {
    _controller.reload();
  }

  Future<String?> html() => _controller.getHtml();
}
