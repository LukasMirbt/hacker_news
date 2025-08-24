import 'package:app/app_shell/app_shell.dart';
import 'package:go_router/go_router.dart';

class SearchBranch extends StatefulShellBranchData {
  const SearchBranch();

  static const config = TypedStatefulShellBranch<SearchBranch>(
    routes: [
      SearchRoute.config,
    ],
  );
}
