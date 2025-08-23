import 'package:app/create_account/create_account.dart';
import 'package:flutter/material.dart';

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
