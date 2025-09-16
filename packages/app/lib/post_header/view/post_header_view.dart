import 'package:app/post/post.dart';
import 'package:app/post_header/post_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostHeaderView extends StatelessWidget {
  const PostHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (PostBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    return Skeletonizer(
      enabled: isLoading,
      child: const PostHeaderBody(),
    );
  }
}
