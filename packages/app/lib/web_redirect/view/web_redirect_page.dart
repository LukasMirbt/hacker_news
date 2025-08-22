import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebRedirectPage extends StatelessWidget {
  const WebRedirectPage({
    required this.url,
    required this.html,
    super.key,
  });

  final String url;
  final String? html;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cookieManager = CookieManager.instance();
        return WebRedirectBloc(
          redirect: WebRedirect.from(url, html: html),
          webRedirectCookieManager: WebRedirectCookieManager(
            cookieManager: cookieManager,
            cookieAdapter: WebRedirectCookieAdapter(
              cookieManager: cookieManager,
            ),
          ),
          webRedirectController: WebRedirectController(),
          authenticationRepository: context.read<AuthenticationRepository>(),
        )..add(
          const WebRedirectStarted(),
        );
      },
      child: const WebRedirectView(),
    );
  }
}
