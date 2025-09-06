import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PostSearchButton extends StatefulWidget {
  const PostSearchButton({super.key});

  @override
  State<PostSearchButton> createState() => _PostSearchButtonState();
}

class _PostSearchButtonState extends State<PostSearchButton> {
  late final SearchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: _controller,
      builder: (BuildContext context, SearchController controller) {
        return IconButton(
          icon: const AppIcon(Symbols.search_rounded),
          onPressed: () {
            controller.openView();
          },
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      },
    );
  }
}
