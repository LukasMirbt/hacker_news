import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      (PostSearchBloc bloc) => bloc.state.resultList.items,
    );

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.sm,
                horizontal: AppSpacing.xlg,
              ),
              child: SearchResult(item),
            ),
            const Divider(height: 1),
            if (index == results.length - 1)
              const SafeArea(child: SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
