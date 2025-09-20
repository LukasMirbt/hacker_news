import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart' hide PostHeaderBody;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostHeaderView extends StatelessWidget {
  const PostHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final isPlaceholder = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.isPlaceholder,
    );

    return Skeletonizer(
      enabled: isPlaceholder,
      child: const PostHeaderBody(),
    );
  }
}
