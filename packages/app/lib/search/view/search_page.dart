import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/search/search.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:link_launcher/link_launcher.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => SearchBloc(
            linkLauncher: context.read<LinkLauncher>(),
          ),
        ),
        BlocProvider(
          create: (context) {
            final controller = AppWebViewController();
            final cookieManager = CookieManager.instance();
            return AppWebViewBloc(
              configuration: SearchWebViewConfiguration(),
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
        ),
      ],
      child: const SearchView(),
    );
  }
}
