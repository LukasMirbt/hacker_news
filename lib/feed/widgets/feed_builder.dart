import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/feed/feed.dart';

class FeedBuilder {
  const FeedBuilder();

  EdgeInsets padding({required bool hasReachedMax}) {
    return EdgeInsets.only(
      bottom: hasReachedMax ? 24 : 0,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final items = context.read<FeedBloc>().state.feed.items;
    final item = items[index];
    return FeedItem(item: item);
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider(height: 0);
  }

  Widget loadingBuilder(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: PaginationSpinner(),
    );
  }
}
