import 'package:go_router/go_router.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';

class ThreadFeedBranch extends StatefulShellBranchData {
  const ThreadFeedBranch();

  static const config = TypedStatefulShellBranch<ThreadFeedBranch>(
    routes: [
      ThreadFeedShellRoute.config,
    ],
  );
}
