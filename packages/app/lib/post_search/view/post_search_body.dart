import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PostSearchBody extends StatelessWidget {
  const PostSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: _Results(),
        ),
      ],
    );
  }
}

class _Results extends StatelessWidget {
  const _Results();

  @override
  Widget build(BuildContext context) {
    final results = context.select(
      (PostSearchBloc bloc) => bloc.state.results,
    );

    return ListView.separated(
      itemCount: results.length,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
      ),
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (context, index) {
        final item = results[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xlg,
          ),
          child: _Result(item),
        );
      },
    );
  }
}

class _Result extends StatelessWidget {
  const _Result(this.item);

  final SearchResult item;

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

  final SearchResult item;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          for (final (index, character) in item.characters.indexed)
            TextSpan(
              text: character,
              style: TextStyle(
                fontWeight: item.isMatchedCharacter(index)
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
        ],
      ),
    );
  }
}
