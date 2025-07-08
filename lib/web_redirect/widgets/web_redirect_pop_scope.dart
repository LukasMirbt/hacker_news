import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectPopScope extends StatelessWidget {
  const WebRedirectPopScope({
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

        final bloc = context.read<WebRedirectBloc>();
        final canGoBack = bloc.state.canGoBack;

        if (canGoBack) {
          bloc.add(
            const WebRedirectBackPressed(),
          );
        } else {
          GoRouter.of(context).pop(result);
        }
      },
      child: child,
    );
  }
}
