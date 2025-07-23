import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:web_links/web_links.dart';

class FeedItemPressListener extends StatelessWidget {
  const FeedItemPressListener({
    required this.child,
    this.webLinks = const WebLinks(),
    this.linkLauncher = const LinkLauncher(),
    super.key,
  });

  final WebLinks webLinks;
  final LinkLauncher linkLauncher;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedBloc, FeedState>(
      listenWhen: (previous, current) =>
          previous.itemPress != current.itemPress,
      listener: (context, state) {
        final itemPress = state.itemPress;
        final urlHost = itemPress.urlHost;

        if (urlHost != null) {
          linkLauncher.launch(itemPress.url);
        } else {
          AppRouter.of(context).goRelative(
            PostRoute(postId: itemPress.id),
          );
        }
      },
      child: child,
    );
  }
}
