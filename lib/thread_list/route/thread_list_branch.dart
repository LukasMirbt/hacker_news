import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadListBranch extends StatefulShellBranchData {
  const ThreadListBranch();

  static const config = TypedStatefulShellBranch<ThreadListBranch>(
    routes: [
      ThreadRoute.config,
    ],
  );
}
