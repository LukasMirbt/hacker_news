import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:post_repository/post_repository.dart';

class PostOptionsSheet extends StatelessWidget {
  const PostOptionsSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (_) => PostOptionsBloc(
          postRepository: context.read<PostRepository>(),
        ),
        child: const PostOptionsSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        OpenOnWebOption(),
      ],
    );
  }
}
