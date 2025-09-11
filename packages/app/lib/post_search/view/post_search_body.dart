import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostSearchBody extends StatelessWidget {
  const PostSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select(
      (PostSearchBloc bloc) => bloc.state.resultList.items,
    );

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isLast = index == items.length - 1;
        return Provider.value(
          value: item,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchResult(),
              const Divider(height: 1),
              if (isLast) const _Footer(),
            ],
          ),
        );
      },
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: SizedBox.shrink());
  }
}
