import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebRedirectPage extends StatelessWidget {
  const WebRedirectPage({
    required this.redirect,
    super.key,
  });

  final WebRedirect redirect;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cookieManager = CookieManager.instance();
        return WebRedirectBloc(
          redirect: redirect,
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
