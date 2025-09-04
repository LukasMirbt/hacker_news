import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum NavigationDecision {
  prevent,
  navigate,
}

typedef OnNavigationRequest = NavigationDecision Function(Uri url);

class AppWebViewConfiguration extends Equatable {
  const AppWebViewConfiguration({
    required this.initialUrl,
    this.initialHtml,
    this.onNavigationRequest,
  });

  final Uri initialUrl;
  final String? initialHtml;
  final OnNavigationRequest? onNavigationRequest;

  InAppWebViewInitialData? initialData() {
    final initialHtml = this.initialHtml;
    if (initialHtml == null) return null;

    return InAppWebViewInitialData(
      baseUrl: WebUri.uri(initialUrl),
      data: initialHtml,
    );
  }

  URLRequest? initialUrlRequest() {
    if (initialHtml != null) return null;

    return URLRequest(
      url: WebUri.uri(initialUrl),
    );
  }

  @override
  List<Object?> get props => [
    initialUrl,
    initialHtml,
    onNavigationRequest,
  ];
}
