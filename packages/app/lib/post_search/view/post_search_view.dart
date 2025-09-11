import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';

class PostSearchView extends StatelessWidget {
  const PostSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PostSearchAppBar(),
      body: PostSearchBody(),
    );
  }
}
