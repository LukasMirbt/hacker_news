import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

          final goRouterState = GoRouter.of(context).state;
          final matchedLocation = goRouterState.matchedLocation;
          if (matchedLocation.contains(WebRedirectRoute.config.path)) return;

          final url = redirect.urlString;
          WebRedirectRoute(url: url).push<void>(context);
        },
      );
}
