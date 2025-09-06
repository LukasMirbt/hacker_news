import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostSearchAnchor extends StatelessWidget {
  const PostSearchAnchor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostSearchBloc(
            postRepository: context.read<PostRepository>(),
          )..add(
            const PostSearchCommentListSubscriptionRequested(),
          ),
      child: const _SearchBar(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) => Icon(
        Icons.search,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      viewOnChanged: (value) {
        context.read<PostSearchBloc>().add(
          PostSearchQueryChanged(value),
        );
      },
      suggestionsBuilder: (_, controller) {
        final results = context.read<PostSearchBloc>().state.results;

        final suggestions = [
          for (final item in results)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
              ),
              child: _Result(item),
            ),
        ];

        return suggestions;
      },
    );
  }
}

class _Result extends StatelessWidget {
  const _Result(this.item);

  final Comment item;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Column(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.hnuser.id,
          style: textTheme.titleMedium,
        ),
        AppHtmlWidget(
          html: item.htmlText,
          onLinkPressed: (_) {},
        ),
      ],
    );
  }
}
