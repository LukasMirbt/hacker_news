import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

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
