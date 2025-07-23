import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyHtml extends StatelessWidget {
  const ReplyHtml({super.key});

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (ReplyBloc bloc) => bloc.state.form.htmlText,
    );

    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: (url) {
        context.read<ReplyBloc>().add(
          ReplyLinkPressed(url),
        );
      },
    );
  }
}
