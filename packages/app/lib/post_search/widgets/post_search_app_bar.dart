import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';

class PostSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostSearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'post_app_bar',
      flightShuttleBuilder:
          (
            flightContext,
            animation,
            direction,
            fromHeroContext,
            toHeroContext,
          ) {
            final fromHero = toHeroContext.widget as Hero;
            final toHero = toHeroContext.widget as Hero;

            final fade = CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0,
                1,
                curve: Curves.easeInOutCubicEmphasized,
              ),
            );

            return Stack(
              children: [
                FadeTransition(
                  opacity: ReverseAnimation(fade),
                  child: fromHero.child,
                ),
                FadeTransition(
                  opacity: fade,
                  child: toHero.child,
                ),
              ],
            );
          },
      child: const _AppBar(),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: const PostSearchBar(),
    );
  }
}
