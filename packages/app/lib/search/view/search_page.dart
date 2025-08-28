import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/search/search.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:web_links/web_links.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final controller = WebRedirectController();
        final cookieManager = CookieManager.instance();
        return WebRedirectBloc(
          redirect: WebRedirect(
            url: const WebLinks().searchUrl(),
          ),
          onNavigationRequest: (url) {
            final isPost = url.toString().startsWith(
              'https://news.ycombinator.com/item?',
            );

            // TODO: Handle not showing Post page for threads:
            // https://news.ycombinator.com/item?id=AdventureMouse

            if (!isPost) {
              final isHackerNews = url.host == 'news.ycombinator.com';
              final isSearch = url.host == 'hn.algolia.com';

              if (!isHackerNews && !isSearch) {
                context.read<LinkLauncher>().launch(
                  url.toString(),
                );
                return NavigationDecision.prevent;
              }
            }

            final postId = url.queryParameters['id'];
            if (postId == null) return NavigationDecision.navigate;

            AppRouter.of(context).goRelative(
              PostRoute(postId: postId),
            );

            return NavigationDecision.prevent;
          },
          webRedirectController: controller,
          webRedirectAuthenticationModel: WebRedirectAuthenticationModel(
            controller: controller,
            cookieManager: WebRedirectCookieManager(
              cookieManager: cookieManager,
              cookieAdapter: WebRedirectCookieAdapter(
                cookieManager: cookieManager,
              ),
            ),
            repository: context.read<AuthenticationRepository>(),
          ),
        )..add(
          const WebRedirectStarted(),
        );
      },
      child: const SearchView(),
    );
  }
}
