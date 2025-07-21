import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadItemOptionsSheet extends StatelessWidget {
  const ThreadItemOptionsSheet({
    required this.item,
    super.key,
  });

  final ThreadFeedItem item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ThreadItemOptionsBloc(
        item: item,
      ),
      child: const ThreadItemOptionsView(),
    );
  }
}
