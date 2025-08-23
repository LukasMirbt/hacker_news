import 'package:app/drafts/drafts.dart';
import 'package:go_router/go_router.dart';

class DraftBranch extends StatefulShellBranchData {
  const DraftBranch();

  static const config = TypedStatefulShellBranch<DraftBranch>(
    routes: [
      DraftShellRoute.config,
    ],
  );
}
