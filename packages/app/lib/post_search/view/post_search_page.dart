import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_search_repository/post_search_repository.dart';

class PostSearchPage extends StatelessWidget {
  const PostSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostSearchBloc(
            postRepository: context.read<PostRepository>(),
            postSearchRepository: context.read<PostSearchRepository>(),
          )..add(
            const PostSearchSubscriptionRequested(),
          ),
      child: const PostSearchView(),
    );
  }
}
