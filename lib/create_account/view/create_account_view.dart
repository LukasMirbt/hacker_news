import 'package:flutter/material.dart';
import 'package:hacker_client/create_account/create_account.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateAccountSuccessListener(
      child: Scaffold(
        appBar: CreateAccountAppBar(),
        body: CreateAccountBody(),
      ),
    );
  }
}
