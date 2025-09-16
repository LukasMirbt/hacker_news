import 'package:app/l10n/l10n.dart';
import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostSearchBar extends StatefulWidget {
  const PostSearchBar({super.key});

  @override
  State<PostSearchBar> createState() => _PostSearchBarState();
}

class _PostSearchBarState extends State<PostSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final state = context.read<PostSearchBloc>().state;
    _controller = TextEditingController(
      text: state.resultList.query,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListenableProvider.value(
      value: _controller,
      child: SearchBar(
        controller: _controller,
        autoFocus: true,
        hintText: l10n.postSearch_hintText,
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onChanged: (value) {
          context.read<PostSearchBloc>().add(
            PostSearchQueryChanged(value),
          );
        },
        trailing: const [
          PostSearchBarClearButton(),
        ],
      ),
    );
  }
}
