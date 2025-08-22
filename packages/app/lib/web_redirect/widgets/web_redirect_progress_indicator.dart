import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebRedirectProgressIndicator extends StatelessWidget {
  const WebRedirectProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final progressValue = context.select(
      (WebRedirectBloc bloc) => bloc.state.progressValue,
    );

    return AnimatedOpacity(
      opacity: progressValue == 1 ? 0 : 1,
      duration: const Duration(milliseconds: 150),
      child: LinearProgressIndicator(value: progressValue),
    );
  }
}
