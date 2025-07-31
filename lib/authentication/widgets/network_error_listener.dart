import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/authentication/authentication.dart';

class NetworkErrorListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  NetworkErrorListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            previous.status.isNetworkError && !current.status.isNetworkError,
        listener: (context, state) {
          GoRouter.of(context).refresh();
        },
      );
}
