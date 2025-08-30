import 'package:app/search/search.dart';
import 'package:go_router/go_router.dart';

class SearchBranch extends StatefulShellBranchData {
  const SearchBranch();

  static const config = TypedStatefulShellBranch<SearchBranch>(
    routes: [
      SearchRoute.config,
    ],
  );
}
