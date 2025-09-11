import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final item = context.read<SearchResultModel>();
        context.read<PostSearchBloc>().add(
          PostSearchItemPressed(item),
        );
        GoRouter.of(context).pop();
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.xlg,
        ),
        child: Column(
          spacing: AppSpacing.xs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _User(),
            SearchResultText(),
          ],
        ),
      ),
    );
  }
}

class _User extends StatelessWidget {
  const _User();

  @override
  Widget build(BuildContext context) {
    final user = context.select(
      (SearchResultModel item) => item.user,
    );

    final textTheme = TextTheme.of(context);

    return Text(
      user,
      style: textTheme.titleSmall,
    );
  }
}
