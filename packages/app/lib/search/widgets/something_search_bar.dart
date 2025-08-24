import 'package:app/app_router/app_router.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
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
      autoFocus: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: AppSpacing.sm),
        child: AppIcon.filled(
          Symbols.search_rounded,
        ),
      ),
      hintText: 'Search Hacker News',
      elevation: const WidgetStatePropertyAll(0),
      onSubmitted: (value) {
        final url = widget.links.searchUrl(value);

        AppRouter.of(context).push(
          WebRedirectRoute(
            $extra: UrlRedirect(url),
          ),
        );

        _controller.clear();
      },
    );
  }
}
