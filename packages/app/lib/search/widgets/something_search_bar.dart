import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:web_links/web_links.dart';

class SomethingSearchBar extends StatefulWidget {
  const SomethingSearchBar({
    this.links = const WebLinks(),
    super.key,
  });

  final WebLinks links;

  @override
  State<SomethingSearchBar> createState() => _SomethingSearchBarState();
}

class _SomethingSearchBarState extends State<SomethingSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textInputAction: TextInputAction.search,
      leading: const Padding(
        padding: EdgeInsets.only(left: AppSpacing.sm),
        child: AppIcon.filled(
          Symbols.search_rounded,
        ),
      ),
      hintText: 'Search Hacker News',
      elevation: const WidgetStatePropertyAll(0),
      onSubmitted: (value) {
        AppRouter.of(context).push(
          SearchWebRedirectRoute(
            search: value,
          ),
        );

        _controller.clear();
      },
    );
  }
}
