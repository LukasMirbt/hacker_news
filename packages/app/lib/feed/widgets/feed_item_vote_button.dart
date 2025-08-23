import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedItemVoteButton extends StatelessWidget {
  const FeedItemVoteButton({
    required this.score,
    required this.item,
    super.key,
  });

  final String score;
  final FeedItemModel item;

  @override
  Widget build(BuildContext context) {
    return AppFeedItemVoteButton(
      data: AppFeedItemVoteButtonData(
        score: score,
        hasBeenUpvoted: item.hasBeenUpvoted,
        onPressed: () {
          context.read<FeedBloc>().add(
            FeedItemVotePressed(item),
          );
        },
      ),
    );
  }
}
