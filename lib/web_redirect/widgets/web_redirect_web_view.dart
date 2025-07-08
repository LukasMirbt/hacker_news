import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class WebRedirectWebView extends StatelessWidget {
  const WebRedirectWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final initialUrlRequest = context.select(
      (WebRedirectBloc bloc) => bloc.state.redirect.initialUrlRequest,
    );

    return InAppWebView(
      initialUrlRequest: initialUrlRequest,
      onWebViewCreated: (controller) {
        context.read<WebRedirectBloc>().add(
          WebRedirectCreated(controller),
        );
      },
      onLoadStart: (_, __) {
        context.read<WebRedirectBloc>().add(
          const WebRedirectLoadStarted(),
        );
      },
      onProgressChanged: (_, progress) {
        context.read<WebRedirectBloc>().add(
          WebRedirectProgressChanged(progress),
        );
      },
      onLoadStop: (_, __) {
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
      onReceivedHttpError: (_, __, errorResponse) {
        context.read<Logger>().severe(
          'Http error',
          errorResponse,
          StackTrace.current,
        );
      },
    );
  }
}
