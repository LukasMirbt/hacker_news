import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/home/widgets/home_tab_bar.dart';
import 'package:provider/provider.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool _isVisible = true;

  void setIsVisible({required bool isVisible}) {
    setState(() {
      _isVisible = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    const tabBarHeight = 48;
    final topSafeArea = MediaQuery.of(context).padding.top;
    final totalBarHeight = appBarHeight + tabBarHeight + topSafeArea;

    return Provider.value(
      value: _isVisible,
      child: Provider.value(
        value: setIsVisible,
        child: DefaultTabController(
          length: FeedType.values.length,
          child: Scaffold(
            drawer: const AppNavigationDrawer(),
            body: Stack(
              children: [
                context.watch<StatefulNavigationShell>(),
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  top: _isVisible ? 0 : -totalBarHeight,
                  left: 0,
                  right: 0,
                  child: ColoredBox(
                    color: ColorScheme.of(context).surface,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShellAppBar(),
                        HomeTabBar(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
