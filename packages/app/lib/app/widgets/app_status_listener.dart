import 'package:app/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppStatusListener extends BlocListener<AppBloc, AppState> {
  AppStatusListener({super.key})
    : super(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          GoRouter.of(context).refresh();
        },
      );
}
