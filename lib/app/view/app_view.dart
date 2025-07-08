import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:nested/nested.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(
      (ThemeBloc bloc) => bloc.state.mode,
    );

    final goRouter = context.select(
      (AppRouterBloc bloc) => bloc.state.router.goRouter,
    );

    return MaterialApp.router(
      themeMode: themeMode,
      routerConfig: goRouter,
      theme: const LightTheme().themeData,
      darkTheme: const DarkTheme().themeData,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        ...AppUiLocalizations.localizationsDelegates,
        ...DateFormatterLocalizations.localizationsDelegates,
      ],
      supportedLocales: const [
        ...AppLocalizations.supportedLocales,
        ...AppUiLocalizations.supportedLocales,
        ...DateFormatterLocalizations.supportedLocales,
      ],
      builder: (context, child) {
        return InheritedGoRouter(
          goRouter: goRouter,
          child: Nested(
            children: [
              LoginRedirectListener(),
              WebRedirectListener(),
              LogoutListener(),
              VoteFailureListener(),
              const RouterDelegateListener(),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
