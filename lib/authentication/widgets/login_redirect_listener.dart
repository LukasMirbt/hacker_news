import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login/login.dart';

class LoginRedirectListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  LoginRedirectListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.redirect != current.redirect,
        listener: (context, state) {
          final redirect = state.redirect;
          if (redirect is! LoginRedirect) return;

          final isAuthenticated = state.status.isAuthenticated;
          if (isAuthenticated) return;

          final goRouterState = GoRouter.of(context).state;
          final matchedLocation = goRouterState.matchedLocation;
          if (matchedLocation == LoginRoute.config.path) return;

          LoginRoute(from: matchedLocation).push<void>(context);
        },
      );
}
