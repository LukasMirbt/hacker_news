import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

enum NavigationDecision {
  prevent,
  navigate,
}

class WebRedirectWebView extends StatefulWidget {
  const WebRedirectWebView({super.key});

  @override
  State<WebRedirectWebView> createState() => _WebRedirectWebViewState();
}

class _WebRedirectWebViewState extends State<WebRedirectWebView> {
  late final InAppWebViewController _webViewController;
  late final PullToRefreshController _pullToRefreshController;

  late final InAppWebViewInitialData? _initialData;
  late final URLRequest? _initialUrlRequest;

  @override
  void initState() {
    super.initState();
    _pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          await _webViewController.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          final url = await _webViewController.getUrl();
          await _webViewController.loadUrl(
            urlRequest: URLRequest(
              url: url,
            ),
          );
        }
      },
    );

    final state = context.read<WebRedirectBloc>().state;
    _initialData = state.redirect.initialData;
    _initialUrlRequest = state.redirect.initialUrlRequest;
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      pullToRefreshController: _pullToRefreshController,
      initialData: _initialData,
      initialUrlRequest: _initialUrlRequest,
      initialSettings: InAppWebViewSettings(
        transparentBackground: true,
      ),
      onWebViewCreated: (controller) {
        _webViewController = controller;
        context.read<WebRedirectBloc>().add(
          WebRedirectCreated(controller),
        );
      },
      shouldOverrideUrlLoading: (controller, navigationAction) {
        final url = navigationAction.request.url;
        if (url == null) return NavigationActionPolicy.ALLOW;

        final state = context.read<WebRedirectBloc>().state;
        final onNavigationRequest = state.onNavigationRequest;
        if (onNavigationRequest == null) return NavigationActionPolicy.ALLOW;

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

        if (progress == 100) {
          _pullToRefreshController.endRefreshing();
        }
      },
      onLoadStop: (controller, url) {
        context.read<WebRedirectBloc>().add(
          WebRedirectLoadStopped(url?.uriValue),
        );

        _pullToRefreshController.endRefreshing();
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

        _pullToRefreshController.endRefreshing();
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
