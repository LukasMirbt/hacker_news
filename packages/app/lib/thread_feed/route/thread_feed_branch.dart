import 'package:app/thread_feed/thread_feed.dart';
import 'package:go_router/go_router.dart';

class ThreadFeedBranch extends StatefulShellBranchData {
  const ThreadFeedBranch();

  static const config = TypedStatefulShellBranch<ThreadFeedBranch>(
    routes: [
      ThreadFeedShellRoute.config,
    ],
  );
}
