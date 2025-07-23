import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadItemOptionsSheet extends StatelessWidget {
  const ThreadItemOptionsSheet({super.key});

  static void show({
    required BuildContext context,
    required ThreadFeedItem item,
  }) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (_) => ThreadItemOptionsBloc(item: item),
        child: const ThreadItemOptionsSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        ReplyOption(),
        ViewPostOption(),
        OpenOnWebOption(),
      ],
    );
  }
}
