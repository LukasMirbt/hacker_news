import 'package:go_router/go_router.dart';
import 'package:hacker_client/drafts/drafts.dart';

class DraftBranch extends StatefulShellBranchData {
  const DraftBranch();

  static const $restorationScopeId = 'draftBranch';

  static const config = TypedStatefulShellBranch<DraftBranch>(
    routes: [
      DraftShellRoute.config,
    ],
  );
}
