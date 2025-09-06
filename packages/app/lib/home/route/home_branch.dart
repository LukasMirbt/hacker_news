import 'package:app/home/home.dart';
import 'package:go_router/go_router.dart';

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static const config = TypedStatefulShellBranch<HomeBranch>(
    routes: [
      HomeRoute.config,
    ],
  );
}
