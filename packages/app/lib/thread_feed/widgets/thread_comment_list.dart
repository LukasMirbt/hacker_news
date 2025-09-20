import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadCommentList extends StatelessWidget {
  const ThreadCommentList(
    this.itemBuilder, {
    super.key,
  });

  final ItemBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return AppPaginatedList();
  }
}
