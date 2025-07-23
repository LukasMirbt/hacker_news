import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:reply_repository/reply_repository.dart';

class ReplyPage extends StatelessWidget {
  const ReplyPage({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReplyBloc(
            url: url,
            replyRepository: context.read<ReplyRepository>(),
          )..add(
            const ReplyStarted(),
          ),
      child: const ReplyView(),
    );
  }
}
