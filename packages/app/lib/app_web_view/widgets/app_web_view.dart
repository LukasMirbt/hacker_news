import 'package:app/app_web_view/app_web_view.dart';
import 'package:app_logging/app_logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({super.key});

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final InAppWebViewInitialData? _initialData;
  late final URLRequest? _initialUrlRequest;

  @override
  void initState() {
    super.initState();
    final state = context.read<AppWebViewBloc>().state;
    final configuration = state.configuration;
    _initialData = configuration.initialData();
    _initialUrlRequest = configuration.initialUrlRequest();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialData: _initialData,
      initialUrlRequest: _initialUrlRequest,
      initialSettings: InAppWebViewSettings(
        // TODO: This causes issues when website background needs to be white
        // but app background is dark
        transparentBackground: true,
      ),
      onWebViewCreated: (controller) {
        context.read<AppWebViewBloc>().add(
          AppWebViewCreated(controller),
        );
      },
      shouldOverrideUrlLoading: (_, navigationAction) {
        final bloc = context.read<AppWebViewBloc>();
        final state = bloc.state;
        final onNavigationRequest = state.configuration.onNavigationRequest;
        if (onNavigationRequest == null) return NavigationActionPolicy.ALLOW;

        final url = navigationAction.request.url;
        if (url == null) return NavigationActionPolicy.ALLOW;

        final decision = onNavigationRequest(url);

        switch (decision) {
          case NavigationDecision.prevent:
            bloc.add(
              AppWebViewNavigationPrevented(url),
            );
            return NavigationActionPolicy.CANCEL;
          case NavigationDecision.navigate:
            return NavigationActionPolicy.ALLOW;
        }
      },
      onLoadStart: (_, url) {
        context.read<AppWebViewBloc>().add(
          AppWebViewLoadStarted(url),
        );
      },
      onUpdateVisitedHistory: (_, url, _) {
        context.read<AppWebViewBloc>().add(
          AppWebViewVisitedHistoryUpdated(url),
        );
      },
      onProgressChanged: (_, progress) {
        context.read<AppWebViewBloc>().add(
          AppWebViewProgressChanged(progress),
        );
      },
      onLoadStop: (controller, url) {
        context.read<AppWebViewBloc>().add(
          AppWebViewLoadStopped(url),
        );

        final brightness = Theme.brightnessOf(context);
        if (brightness == Brightness.light) return;
        /* 
        if (url?.host != 'news.ycombinator.com') return;

        const css = '''
        #hnmain {
            background-color: #121212 !important;
        }
        body {
            color: #E0E0E0;
        }
        .titleline > a {
            color: #E0E0E0 !important;
        }
        ''';

        controller.injectCSSCode(source: css); */
      },
      onReceivedError: (_, request, error) {
        context.read<AppWebViewBloc>().add(
          AppWebViewReceivedError(request.url),
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
