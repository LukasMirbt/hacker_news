import 'package:app/app_router/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRedirectListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  LoginRedirectListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.loginRedirect != current.loginRedirect,
        listener: (context, state) {
          final isAuthenticated = state.status.isAuthenticated;
          if (isAuthenticated) return;

          final appRouter = AppRouter.of(context);
          final matchedLocation = appRouter.matchedLocation;
          final loginPath = LoginRoute.config.path;
          if (matchedLocation.contains(loginPath)) return;

          appRouter.push(
            LoginRoute(from: appRouter.currentLocation),
          );
        },
      );
}
