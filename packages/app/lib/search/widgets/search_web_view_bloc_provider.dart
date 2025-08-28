import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/search/search.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SearchWebViewBlocProvider extends StatelessWidget {
  const SearchWebViewBlocProvider({
    required this.child,
    this.navigationModel = const SearchNavigationModel(),
    super.key,
  });

  final SearchNavigationModel navigationModel;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final controller = AppWebViewController();
        final cookieManager = CookieManager.instance();
        return AppWebViewBloc(
          configuration: AppWebViewConfiguration.from(
            initialUrl: navigationModel.initialUrl,
          ),
          onNavigationRequest: (url) {
            final decision = navigationModel.navigate(url);
            switch (decision) {
              case SearchNavigationDecision.navigate:
                return NavigationDecision.navigate;
              case SearchNavigationDecision.externalLink:
                context.read<SearchBloc>().add(
                  SearchExternalLinkPressed(url),
                );
                return NavigationDecision.prevent;
              case SearchNavigationDecision.post:
                final postId = url.queryParameters['id'];
                if (postId == null) return NavigationDecision.navigate;

                AppRouter.of(context).goRelative(
                  PostRoute(postId: postId),
                );

                return NavigationDecision.prevent;
            }
          },
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
      child: child,
    );
  }
}
