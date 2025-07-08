import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectPage extends StatelessWidget {
  const WebRedirectPage({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cookieManager = CookieManager.instance();
        return WebRedirectBloc(
          redirect: WebRedirect.from(url),
          webRedirectCookieManager: WebRedirectCookieManager(
            cookieManager: cookieManager,
            cookieAdapter: WebRedirectCookieAdapter(
              cookieManager: cookieManager,
            ),
          ),
          webRedirectActionModel: WebRedirectActionModel(),
          authenticationRepository: context.read<AuthenticationRepository>(),
        )..add(
          const WebRedirectStarted(),
        );
      },
      child: const WebRedirectView(),
    );
  }
}
