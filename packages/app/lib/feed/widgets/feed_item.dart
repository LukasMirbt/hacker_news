import 'package:app/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedItem extends StatelessWidget {
  const FeedItem(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final item = context.select(
      (FeedBloc bloc) => bloc.state.feed.items[index],
    );

    return switch (item) {
      final PostFeedItemModel item => PostFeedItem(item),
      final JobFeedItemModel item => JobFeedItem(item),
    };
  }
}
