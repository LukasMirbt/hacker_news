import 'package:app/app_shell/app_shell.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

class AppShellModel extends Equatable {
  const AppShellModel({
    required this.shell,
    required this.destination,
    required this.drawer,
    required this.appBar,
  });

  factory AppShellModel.from(StatefulNavigationShell shell) {
    final index = shell.currentIndex;
    final destination = AppDestination.values[index];
    return AppShellModel(
      shell: shell,
      destination: destination,
      drawer: ShellDrawerModel(destination),
      appBar: ShellAppBarModel(destination),
    );
  }

  final StatefulNavigationShell shell;
  final AppDestination destination;
  final ShellDrawerModel drawer;
  final ShellAppBarModel appBar;

  bool get resizeToAvoidBottomInset {
    return switch (destination) {
      AppDestination.search => true,
      _ => false,
    };
  }

  @override
  List<Object> get props => [
    shell,
    destination,
    drawer,
    appBar,
  ];
}
