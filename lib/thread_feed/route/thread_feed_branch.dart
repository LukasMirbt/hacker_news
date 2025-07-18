import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class ThreadFeedBranch extends StatefulShellBranchData {
  const ThreadFeedBranch();

  static const config = TypedStatefulShellBranch<ThreadFeedBranch>(
    routes: [
      ThreadFeedRoute.config,
    ],
  );
}
