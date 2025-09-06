import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSearchBar extends StatelessWidget {
  const PostSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: (value) {
        context.read<PostSearchBloc>().add(
          PostSearchQueryChanged(value),
        );
      },
    );
  }
}
