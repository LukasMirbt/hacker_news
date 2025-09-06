import 'package:app/app_web_view/app_web_view.dart';
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

  final Uri url;
  final String? html;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final controller = AppWebViewController();
        final cookieManager = CookieManager.instance();
        return AppWebViewBloc(
          configuration: WebRedirectWebViewConfiguration(
            url: url,
            html: html,
          ),
          appWebViewController: controller,
          appWebViewAuthenticationModel: AppWebViewAuthenticationModel(
            controller: controller,
            cookieManager: AppWebViewCookieManager(
              cookieManager: cookieManager,
              cookieAdapter: AppWebViewCookieAdapter(
                cookieManager: cookieManager,
              ),
            ),
            repository: context.read<AuthenticationRepository>(),
          ),
        )..add(
          const AppWebViewStarted(),
        );
      },
      child: const WebRedirectView(),
    );
  }
}
