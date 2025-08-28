import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppWebViewPopScope extends StatelessWidget {
  const AppWebViewPopScope({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final bloc = context.read<AppWebViewBloc>();
        final canGoBack = bloc.state.canGoBack;

        if (canGoBack) {
          bloc.add(
            const AppWebViewBackPressed(),
          );
        } else {
          GoRouter.of(context).pop(result);
        }
      },
      child: child,
    );
  }
}
