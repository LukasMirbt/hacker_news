import 'package:app/app_router/app_router.dart';
import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/post/post.dart';
import 'package:app/search/search.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_links/web_links.dart';

class SearchPreventedNavigationListener extends StatelessWidget {
  const SearchPreventedNavigationListener({
    required this.child,
    this.links = const WebLinks(),
    super.key,
  });

  final Widget child;
  final WebLinks links;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppWebViewBloc, AppWebViewState>(
      listenWhen: (previous, current) =>
          previous.preventedNavigation != current.preventedNavigation,
      listener: (context, state) {
        final url = state.preventedNavigation.url;
        final isPost = links.isPost(url);

        if (!isPost) {
          context.read<SearchBloc>().add(
            SearchExternalLinkPressed(url),
          );
          return;
        }

        final postId = url.queryParameters['id']!;

        AppRouter.of(context).goRelative(
          PostRoute(postId: postId),
        );
      },
      child: child,
    );
  }
}
