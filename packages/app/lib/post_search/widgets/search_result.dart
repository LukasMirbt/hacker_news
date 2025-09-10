import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResult extends StatelessWidget {
  const SearchResult(this.item, {super.key});

  final SearchResultModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return InkWell(
      onTap: () {
        context.read<PostSearchBloc>().add(
          PostSearchItemPressed(item),
        );
        GoRouter.of(context).pop();
      },
      child: Column(
        spacing: AppSpacing.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.user,
            style: textTheme.titleMedium,
          ),
          _ResultText(item),
        ],
      ),
    );
  }
}

class _ResultText extends StatelessWidget {
  const _ResultText(this.item);

  final SearchResultModel item;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        children: [
          if (!item.snippet.match.isStartOfText) const TextSpan(text: '...'),
          for (final (index, character) in item.snippet.characters.indexed)
            TextSpan(
              text: character,
              style: TextStyle(
                fontWeight: item.snippet.match.contains(index)
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          if (!item.snippet.match.isEndOfText) const TextSpan(text: '...'),
        ],
      ),
    );
  }
}
