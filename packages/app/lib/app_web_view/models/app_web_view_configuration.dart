import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppWebViewConfiguration extends Equatable {
  const AppWebViewConfiguration({
    required this.initialData,
    required this.initialUrlRequest,
  });

  factory AppWebViewConfiguration.from({
    required Uri initialUrl,
    String? initialHtml,
  }) {
    if (initialHtml != null) {
      return AppWebViewConfiguration(
        initialUrlRequest: null,
        initialData: InAppWebViewInitialData(
          baseUrl: WebUri.uri(initialUrl),
          data: initialHtml,
        ),
      );
    } else {
      return AppWebViewConfiguration(
        initialData: null,
        initialUrlRequest: URLRequest(
          url: WebUri.uri(initialUrl),
        ),
      );
    }
  }

  final InAppWebViewInitialData? initialData;
  final URLRequest? initialUrlRequest;

  @override
  List<Object?> get props => [
    initialUrlRequest,
    initialData,
  ];
}
