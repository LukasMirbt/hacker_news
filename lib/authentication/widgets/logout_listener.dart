import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/logout_loading/logout_loading.dart';

class LogoutListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  LogoutListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.status.isAuthenticated && current.status.isUnauthenticated,
        listener: (context, state) {
          const LogoutLoadingRoute().go(context);
        },
      );
}
