import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();

  static const $restorationScopeId = 'settingsBranch';

  static const config = TypedStatefulShellBranch<SettingsBranch>(
    routes: [
      SettingsRoute.config,
    ],
  );
}
