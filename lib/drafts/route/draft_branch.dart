import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class DraftBranch extends StatefulShellBranchData {
  const DraftBranch();

  static const config = TypedStatefulShellBranch<DraftBranch>(
    routes: [
      DraftRoute.config,
    ],
  );
}
