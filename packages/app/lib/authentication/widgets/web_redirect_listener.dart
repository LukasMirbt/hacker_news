import 'package:app/app_router/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebRedirectListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  WebRedirectListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.webRedirect != current.webRedirect,
        listener: (context, state) {
          final router = AppRouter.of(context);
          final matchedLocation = router.matchedLocation;
          if (matchedLocation == WebRedirectRoute.config.path) return;

          final redirect = state.webRedirect;

          router.push(
            WebRedirectRoute(
              url: redirect.url,
              from: router.from,
            ),
          );
        },
      );
}
