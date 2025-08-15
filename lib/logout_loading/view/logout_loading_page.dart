import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';

// TODO(LukasMirbt): Redirect to from when logging out from web redirect?

class LogoutLoadingPage extends StatefulWidget {
  const LogoutLoadingPage({super.key});

  static const delay = Duration(seconds: 1);

  @override
  State<LogoutLoadingPage> createState() => _LogoutLoadingPageState();
}

class _LogoutLoadingPageState extends State<LogoutLoadingPage> {
  @override
  void initState() {
    super.initState();
    _waitAndRedirect();
  }

  Future<void> _waitAndRedirect() async {
    await Future<void>.delayed(LogoutLoadingPage.delay);
    if (!mounted) return;
    GoRouter.of(context).go(AppRouter.initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.lg,
            children: [
              const CircularProgressIndicator(),
              Text(l10n.logoutLoading_text),
            ],
          ),
        ),
      ),
    );
  }
}
