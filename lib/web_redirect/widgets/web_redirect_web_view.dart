import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class WebRedirectWebView extends StatelessWidget {
  const WebRedirectWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final urlRequest = context.select(
      (WebRedirectBloc bloc) => bloc.state.redirect.initialUrlRequest,
    );

    final initialData = context.select(
      (WebRedirectBloc bloc) => bloc.state.redirect.initialData,
    );

    URLRequest? initialUrlRequest;

    if (initialData == null) {
      initialUrlRequest = urlRequest;
    }

    // TODO: Parse request HTML so authentication status gets updated

    return InAppWebView(
      initialUrlRequest: initialUrlRequest,
      initialData: initialData,
      onWebViewCreated: (controller) {
        context.read<WebRedirectBloc>().add(
          WebRedirectCreated(controller),
        );
      },
      onLoadStart: (_, _) {
        context.read<WebRedirectBloc>().add(
          const WebRedirectLoadStarted(),
        );
      },
      onProgressChanged: (_, progress) {
        context.read<WebRedirectBloc>().add(
          WebRedirectProgressChanged(progress),
        );
      },
      onLoadStop: (_, _) {
        context.read<WebRedirectBloc>().add(
          const WebRedirectLoadStopped(),
        );
      },
      onReceivedError: (controller, request, error) {
        context.read<Logger>().severe(
          'Error',
          error,
          StackTrace.current,
        );
      },
      onReceivedHttpError: (_, _, errorResponse) {
        context.read<Logger>().severe(
          'Http error',
          errorResponse,
          StackTrace.current,
        );
      },
    );
  }
}
