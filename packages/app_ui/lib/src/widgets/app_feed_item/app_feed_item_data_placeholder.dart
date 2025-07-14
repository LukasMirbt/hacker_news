import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppFeedItemDataPlaceholder extends AppFeedItemData {
  AppFeedItemDataPlaceholder({
    bool? hasBeenVisited,
    String? rank,
    String? title,
    String? age,
    String? urlHost,
    String? user,
    void Function()? onPressed,
    void Function()? onSharePressed,
    void Function()? onMorePressed,
    Widget? voteButton,
    Widget? commentCountButton,
  }) : super(
         hasBeenVisited: hasBeenVisited ?? true,
         rank: rank ?? 'rank',
         title: title ?? 'title',
         age: age ?? 'age',
         urlHost: urlHost ?? 'urlHost',
         user: user ?? 'user',
         onPressed: onPressed ?? () {},
         onSharePressed: onSharePressed ?? () {},
         onMorePressed: onMorePressed ?? () {},
         voteButton: voteButton ?? const SizedBox.shrink(),
         commentCountButton: commentCountButton ?? const SizedBox.shrink(),
       );
}
