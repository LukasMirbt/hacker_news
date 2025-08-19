import 'package:flutter/material.dart';
import 'package:hacker_client/data_collection/data_collection.dart';
import 'package:hacker_client/l10n/l10n.dart';

class DataCollectionView extends StatelessWidget {
  const DataCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: DataCollectionBody(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.dataCollection_title),
    );
  }
}
