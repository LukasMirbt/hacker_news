import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSearchView extends StatelessWidget {
  const PostSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PostSearchAppBar(),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isEmpty = context.select(
      (PostSearchBloc bloc) => bloc.state.resultList.isEmpty,
    );

    if (isEmpty) return const PostSearchEmptyBody();

    return const PostSearchBody();
  }
}
