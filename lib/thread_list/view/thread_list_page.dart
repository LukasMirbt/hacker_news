import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadListPage extends StatelessWidget {
  const ThreadListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThreadListBloc(
            threadRepository: context.read<ThreadRepository>(),
            authenticationRepository: context.read<AuthenticationRepository>(),
            linkLauncher: const LinkLauncher(),
          )..add(
            const ThreadListStarted(),
          ),
      child: const ThreadListView(),
    );
  }
}
