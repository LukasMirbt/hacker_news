import 'package:app/post_options/post_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOption extends StatelessWidget {
  const UserOption({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select(
      (PostOptionsBloc bloc) => bloc.state.post.user,
    );

    if (user == null) return const SizedBox.shrink();

    return UserOptionBody(user: user);
  }
}
