import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static const $restorationScopeId = 'homeBranch';

  static const config = TypedStatefulShellBranch<HomeBranch>(
    routes: [
      HomeRoute.config,
    ],
  );
}
