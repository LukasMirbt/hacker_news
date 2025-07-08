import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_form/reply_form.dart';

class ReplyFormHtmlBody extends StatelessWidget {
  const ReplyFormHtmlBody({
    required this.htmlText,
    super.key,
  });

  final String htmlText;

  @override
  Widget build(BuildContext context) {
    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: (url) {
        context.read<ReplyFormBloc>().add(
          ReplyFormLinkPressed(url),
        );
      },
    );
  }
}
