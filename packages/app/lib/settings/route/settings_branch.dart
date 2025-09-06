import 'package:app/settings/settings.dart';
import 'package:go_router/go_router.dart';

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();

  static const config = TypedStatefulShellBranch<SettingsBranch>(
    routes: [
      SettingsRoute.config,
    ],
  );
}
