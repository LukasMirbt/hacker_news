import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSearchBar extends StatelessWidget {
  const PostSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return SearchBar(
      autoFocus: true,
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(),
      ),
      hintStyle: WidgetStatePropertyAll(
        textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      hintText: 'Search comments',

      onChanged: (value) {
        context.read<PostSearchBloc>().add(
          PostSearchQueryChanged(value),
        );
      },
    );
  }
}
