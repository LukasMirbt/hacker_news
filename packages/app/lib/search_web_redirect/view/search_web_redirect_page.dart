import 'package:app/app_router/app_router.dart';
import 'package:app/post/post.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:web_links/web_links.dart';

class SearchWebRedirectPage extends StatelessWidget {
  const SearchWebRedirectPage({
    required this.search,
    super.key,
  });

  final String search;

  @override
  Widget build(BuildContext context) {
    return WebRedirectPage(
      redirect: WebRedirect(
        url: const WebLinks().searchUrl(search),
      ),
      onNavigationRequest: (url) {
        final isPost = url.toString().startsWith(
          'https://news.ycombinator.com/item?',
        );

        if (!isPost) return NavigationDecision.navigate;

        final postId = url.queryParameters['id'];

        AppRouter.of(context).pushRelative(
          PostRoute(postId: postId!),
        );

        return NavigationDecision.prevent;
      },
    );
  }
}
