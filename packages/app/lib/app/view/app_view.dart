import 'package:app/app/app.dart';
import 'package:app/app_router/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/theme/theme.dart';
import 'package:app/vote_failure/vote_failure.dart';
import 'package:app_ui/app_ui.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final ThemeData theme;
  late final ThemeData darkTheme;

  @override
  void initState() {
    super.initState();
    theme = const LightTheme().themeData;
    darkTheme = const DarkTheme().themeData;
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(
      (ThemeBloc bloc) => bloc.state.mode,
    );

    final goRouter = context.select(
      (AppRouter router) => router.goRouter,
    );

    return MaterialApp.router(
      restorationScopeId: 'app',
      themeMode: themeMode,
      routerConfig: goRouter,
      theme: theme,
      darkTheme: darkTheme,
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
              LoginSuccessListener(),
              WebRedirectListener(),
              LogoutListener(),
              VoteFailureListener(),
              AppStatusListener(),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
