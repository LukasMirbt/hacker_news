import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';

class FeedItemOptionsSheet extends StatelessWidget {
  const FeedItemOptionsSheet({super.key});

  static void show({
    required BuildContext context,
    required FeedItem item,
  }) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (_) => FeedItemOptionsBloc(item: item),
        child: const FeedItemOptionsSheet(),
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
