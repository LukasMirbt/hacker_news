import 'package:app/drafts/drafts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraftBody extends StatelessWidget {
  const DraftBody({
    super.key,
    this.builder = const DraftBuilder(),
  });

  final DraftBuilder builder;

  @override
  Widget build(BuildContext context) {
    final drafts = context.select(
      (DraftBloc bloc) => bloc.state.drafts,
    );

    return ListView.builder(
      itemCount: drafts.length,
      itemBuilder: builder.itemBuilder,
    );
  }
}
