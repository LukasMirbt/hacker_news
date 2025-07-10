import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app/app.dart';

class AppStatusListener extends BlocListener<AppBloc, AppState> {
  AppStatusListener({super.key})
    : super(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          GoRouter.of(context).refresh();
        },
      );
}
