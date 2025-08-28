import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_logging/app_logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class WebRedirectWebView extends StatefulWidget {
  const WebRedirectWebView({super.key});

  @override
  State<WebRedirectWebView> createState() => _WebRedirectWebViewState();
}

class _WebRedirectWebViewState extends State<WebRedirectWebView> {
  late final InAppWebViewInitialData? _initialData;
  late final URLRequest? _initialUrlRequest;

  @override
  void initState() {
    super.initState();
    final state = context.read<WebRedirectBloc>().state;
    _initialData = state.redirect.initialData;
    _initialUrlRequest = state.redirect.initialUrlRequest;
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialData: _initialData,
      initialUrlRequest: _initialUrlRequest,
      onWebViewCreated: (controller) {
        context.read<WebRedirectBloc>().add(
          WebRedirectCreated(controller),
        );
      },
      shouldOverrideUrlLoading: (_, navigationAction) {
        final state = context.read<WebRedirectBloc>().state;
        final onNavigationRequest = state.onNavigationRequest;
        if (onNavigationRequest == null) return NavigationActionPolicy.ALLOW;

        final url = navigationAction.request.url;
        if (url == null) return NavigationActionPolicy.ALLOW;

        final decision = onNavigationRequest(url);

        return switch (decision) {
          NavigationDecision.prevent => NavigationActionPolicy.CANCEL,
          NavigationDecision.navigate => NavigationActionPolicy.ALLOW,
        };
      },
      onLoadStart: (_, _) {
        context.read<WebRedirectBloc>().add(
          const WebRedirectLoadStarted(),
        );
      },
      onUpdateVisitedHistory: (_, _, _) {
        context.read<WebRedirectBloc>().add(
          const WebRedirectVisitedHistoryUpdated(),
        );
      },
      onProgressChanged: (_, progress) {
        context.read<WebRedirectBloc>().add(
          WebRedirectProgressChanged(progress),
        );
      },
      onLoadStop: (_, url) {
        context.read<WebRedirectBloc>().add(
          WebRedirectLoadStopped(url?.uriValue),
        );
      },
      onReceivedError: (_, _, error) {
        context.read<WebRedirectBloc>().add(
          const WebRedirectReceivedError(),
        );

        context.read<Logger>().severe(
          'Error',
          error,
          StackTrace.current,
        );
      },
      onReceivedHttpError: (_, _, response) {
        context.read<Logger>().severe(
          'Http error',
          response.statusCode,
          StackTrace.current,
        );
      },
    );
  }
}
