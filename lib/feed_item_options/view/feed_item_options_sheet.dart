import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';

class FeedItemOptionsSheet extends StatelessWidget {
  const FeedItemOptionsSheet({
    required this.item,
    super.key,
  });

  final FeedItem item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => FeedItemOptionsBloc(item: item),
      child: const FeedItemOptionsView(),
    );
  }
}
