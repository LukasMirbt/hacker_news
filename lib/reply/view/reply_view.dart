import 'package:flutter/material.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyView extends StatelessWidget {
  const ReplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReplySuccessListener(
      child: ReplyFailureListener(
        child: Scaffold(
          appBar: ReplyAppBar(),
          body: ReplyBody(),
        ),
      ),
    );
  }
}
