// ignore_for_file: use_setters_to_change_properties

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebRedirectController {
  late InAppWebViewController _controller;

  void initialize(InAppWebViewController controller) {
    _controller = controller;
  }

  Future<bool> canGoBack() => _controller.canGoBack();

  Future<bool> canGoForward() => _controller.canGoForward();

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
