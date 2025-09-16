import 'package:app/l10n/l10n.dart';
import 'package:app/post/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostAppBar({super.key});

  static const heroTag = 'postAppBar';

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: ListenableProvider.value(
        value: context.read<ScrollController>(),
        child: const _AppBar(),
      ),
    );
  }
}

class _AppBar extends StatefulWidget {
  const _AppBar();

  @override
  State<_AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  late final ScrollController _controller;
  bool _isTitleVisible = false;

  void _onScrolled() {
    final offset = _controller.offset;

    if (offset > 125 && !_isTitleVisible) {
      setState(() {
        _isTitleVisible = true;
      });
    } else if (offset <= 125 && _isTitleVisible) {
      setState(() {
        _isTitleVisible = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = context.read<ScrollController>();
    _isTitleVisible = _controller.offset > 125;
    _controller.addListener(_onScrolled);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrolled);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      leading: const PostBackButton(),
      title: AnimatedOpacity(
        opacity: _isTitleVisible ? 1 : 0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Text(l10n.post_title),
      ),
      actions: const [
        PostSearchButton(),
      ],
    );
  }
}
