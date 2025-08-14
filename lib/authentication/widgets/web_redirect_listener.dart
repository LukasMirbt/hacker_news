import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  WebRedirectListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.webRedirect != current.webRedirect,
        listener: (context, state) {
          final appRouter = AppRouter.of(context);
          final matchedLocation = appRouter.matchedLocation;
          if (matchedLocation == WebRedirectRoute.config.path) return;

          final redirect = state.webRedirect;

          appRouter.push(
            WebRedirectRoute(
              url: redirect.urlString,
              $extra: redirect.html,
            ),
          );
        },
      );
}
