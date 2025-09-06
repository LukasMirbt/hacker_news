import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginLoadingPage extends StatefulWidget {
  const LoginLoadingPage({
    required this.from,
    super.key,
  });

  final String from;

  static const delay = Duration(seconds: 1);

  @override
  State<LoginLoadingPage> createState() => _LoginLoadingPageState();
}

class _LoginLoadingPageState extends State<LoginLoadingPage> {
  @override
  void initState() {
    super.initState();
    _waitAndRedirect();
  }

  Future<void> _waitAndRedirect() async {
    await Future<void>.delayed(LoginLoadingPage.delay);
    if (!mounted) return;
    GoRouter.of(context).go(widget.from);
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
              Text(l10n.loginLoading_text),
            ],
          ),
        ),
      ),
    );
  }
}
