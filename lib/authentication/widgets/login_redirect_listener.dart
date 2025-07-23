import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
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

          final appRouter = AppRouter.of(context);
          final matchedLocation = appRouter.matchedLocation;
          if (matchedLocation == LoginRoute.config.path) return;

          appRouter.push(
            LoginRoute(from: matchedLocation),
          );
        },
      );
}
