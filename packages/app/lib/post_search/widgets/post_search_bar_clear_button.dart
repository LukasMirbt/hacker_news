import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSearchBarClearButton extends StatelessWidget {
  const PostSearchBarClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = context.select(
      (TextEditingController controller) => controller.text.isEmpty,
    );

    return AnimatedOpacity(
      opacity: isEmpty ? 0 : 1,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: const _ClearButton(),
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(Symbols.close_rounded),
      onPressed: () {
        context.read<TextEditingController>().clear();
        context.read<PostSearchBloc>().add(
          const PostSearchCleared(),
        );
      },
    );
  }
}
