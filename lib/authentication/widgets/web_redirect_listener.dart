import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  WebRedirectListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.redirect != current.redirect,
        listener: (context, state) {
          final redirect = state.redirect;
          if (redirect is! WebRedirect) return;

          final appRouter = AppRouter.of(context);
          final matchedLocation = appRouter.matchedLocation;
          if (matchedLocation == WebRedirectRoute.config.path) return;

          appRouter.push(
            WebRedirectRoute(
              url: redirect.urlString,
              $extra: redirect.html,
            ),
          );
        },
      );
}
