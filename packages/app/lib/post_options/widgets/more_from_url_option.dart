import 'package:app/post_options/post_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreFromUrlOption extends StatelessWidget {
  const MoreFromUrlOption({super.key});

  @override
  Widget build(BuildContext context) {
    final urlHost = context.select(
      (PostOptionsBloc bloc) => bloc.state.post.urlHost,
    );

    if (urlHost == null) return const SizedBox.shrink();

    return MoreFromUrlOptionBody(urlHost: urlHost);
  }
}
