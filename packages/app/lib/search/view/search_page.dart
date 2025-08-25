import 'package:app/app_router/app_router.dart';
import 'package:app/post/post.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';

// TODO: Inline webview with hn.algolia.com as first page,

// TODO: State restore url even after changing from initial

// TODO: Replace WebRedirect actionbar refresh button with pull-to-refresh

// TODO: Put close button in AppBar?
// TODO: Show page title in AppBar title?

// TODO: Figure out if it's possible to have dark mode in webview

// TODO: Fix webview navigation bar dark mode colors

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WebRedirectPage(
      redirect: WebRedirect(
        url: Uri.parse('https://hn.algolia.com'),
      ),
      onNavigationRequest: (url) {
        final isPost = url.toString().startsWith(
          'https://news.ycombinator.com/item?',
        );

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

        AppRouter.of(context).pushRelative(
          PostRoute(postId: postId),
        );

        return NavigationDecision.prevent;
      },
    );
  }
}
