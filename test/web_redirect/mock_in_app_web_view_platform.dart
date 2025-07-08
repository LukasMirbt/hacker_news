// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class _MockWebViewWidget extends Mock
    with MockPlatformInterfaceMixin
    implements PlatformInAppWebViewWidget {
  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}

class _MockPlatformCookieManager extends Mock
    with MockPlatformInterfaceMixin
    implements PlatformCookieManager {}

class MockInAppWebViewPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements InAppWebViewPlatform {
  late final PlatformInAppWebViewWidgetCreationParams params;

  @override
  PlatformInAppWebViewWidget createPlatformInAppWebViewWidget(
    PlatformInAppWebViewWidgetCreationParams params,
  ) {
    this.params = params;
    return _MockWebViewWidget();
  }

  @override
  PlatformCookieManager createPlatformCookieManager(
    PlatformCookieManagerCreationParams params,
  ) {
    return _MockPlatformCookieManager();
  }
}
